module LogService
  class CreateLog < ApplicationService

    attr_reader :log_file

    def initialize(log_file = nil)
      @log_file = log_file
      @log_line = []
    end

    def call
      read_log
      @log_line
    end

    def read_log
      log_text = File.open(log_file).read unless log_file.nil?
      log_text.gsub!(/\r\n?/, "\n")
      log_text.each_line do |line|
        @log_line << line
      end
    end
  end
end
