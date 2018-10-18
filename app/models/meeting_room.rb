class MeetingRoom < ApplicationRecord
  has_many :users, foreign_key: :meeting_id, class_name: :User
  validates :name, presence: true, uniqueness: true
end
