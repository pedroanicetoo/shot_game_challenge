class Player < ApplicationRecord
  validates :nick, presence: true, uniqueness: true
end
