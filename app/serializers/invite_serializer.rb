class InviteSerializer < ActiveModel::Serializer
  attributes :id, :sender, :receiver
end
