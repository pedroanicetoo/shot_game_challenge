class Log < ApplicationRecord
  enum kind: {
    start: 0,
    end: 1,
    kill: 2
  }

  belongs_to :match
  belongs_to :murder, class_name: 'Player', required: false
  belongs_to :victim, class_name: 'Player', required: false

  validate :valid_log?

  private

  def valid_log?
    errors.add(:base, :invalid) if Log.find_by(match_id: match_id, kind: 'end').present?
  end
end
