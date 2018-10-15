class InviteSerializer < ActiveModel::Serializer
  attributes :id, :sender, :receiver, :room
end
