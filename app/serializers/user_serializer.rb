class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :logged_in, :city, :country, :image_url, :meeting_id

  has_many :sent_emails
  has_many :received_emails
  
end
