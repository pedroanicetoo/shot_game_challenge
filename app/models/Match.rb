class Match < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  has_many :logs
end
