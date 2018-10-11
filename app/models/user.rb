class User < ApplicationRecord
  has_secure_password
  has_many :sent_emails, foreign_key: :sender_id, class_name: :Email
  has_many :received_emails, foreign_key: :receiver_id, class_name: :Email
  has_many :contacts, foreign_key: :user_1, class_name: :Contact

  validates :email, :username, uniqueness: true
  validates :city, :country, :image_url, presence: true

  def self.current_users
    User.all.select { |user| user.logged_in == true }
  end

end
