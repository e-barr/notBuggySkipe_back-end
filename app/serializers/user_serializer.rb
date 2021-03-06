class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :city, :country, :image_url, :meeting_id

  has_many :sent_invites
  has_many :received_invites
  has_many :contacts
  belongs_to :meeting_room, optional: true
end
