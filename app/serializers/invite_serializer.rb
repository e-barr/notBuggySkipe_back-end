class InviteSerializer < ActiveModel::Serializer
  attributes :id, :sender, :receiver, :room, :content
end
