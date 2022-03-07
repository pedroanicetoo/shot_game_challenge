module LogService
  class CreateLog < ApplicationService

    attr_reader :log_file

    def initialize(log_file = nil)
      @log_file = log_file
      @log_line = []
      @format_error = false
      @match = nil
    end

    def call
      read_log
      create_log
    end

    private

    def read_log
      log_text = File.open(log_file).read unless log_file.nil?
      log_text.gsub!(/\r\n?/, "\n")
      log_text.each_line do |line|
        @log_line << line if line.present?
      end
    end

    def create_log
      @log_line.each do |log|
        if log.include? 'has started'
          title = log.split(' - ').last.split[2]
          @match = Match.find_or_create_by(title: title)
        end

        raise ArgumentError.new('Has invalid Log match') unless @match.valid?

        date_str   = log.split(' - ')[0].strip
        log_date   = DateTime.strptime(date_str, '%d/%m/%Y %H:%M:%S')
        attrs      = { file_text: log, moment: log_date, match: @match }
        kind_attrs = attrs_by_kind(log)
        Log.create(attrs.merge(kind_attrs))
      end
    end

    def attrs_by_kind(log)
      return { kind: 'start' } if log.include? 'has started'
      return { kind: 'end' } if log.include? 'has ended'

      if log.include? 'killed'
        kill_log = log.split(' - ').last.split
        murder = kill_log[0] == '<WORLD>' ? nil : Player.find_or_create_by(nick: kill_log[0])
        victim = Player.find_or_create_by(nick: kill_log[2])
        return { kind: 'kill', murder: murder, victim: victim, death_reason: kill_log.last }
      end

      raise ArgumentError.new('Invalid Log Kind')
    end
  end
end
