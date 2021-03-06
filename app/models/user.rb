class User < ApplicationRecord
  has_secure_password

  has_many :sent_invites, foreign_key: :sender_id, class_name: :Invite
  has_many :received_invites, foreign_key: :receiver_id, class_name: :Invite
  has_many :contacts, foreign_key: :user_1, class_name: :Contact
  belongs_to :meeting_room, foreign_key: :meeting_id, class_name: :MeetingRoom, optional: true

  validates :email, :username, uniqueness: true
  validates :city, :country, :image_url, presence: true

  def authenticate(plaintext_password)
    if BCrypt::Password.new(self.password_digest) == plaintext_password
      self
    else
      false
    end
  end

  def self.current_users(current_id)
    User.all.select { |user| user.id != current_id }
  end

end
