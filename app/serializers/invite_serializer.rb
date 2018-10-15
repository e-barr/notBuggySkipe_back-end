class InviteSerializer < ActiveModel::Serializer
  attributes :id, :sender_name, :receiver_name, :room_name

  def sender_username
    sender.username
  end

  def receiver_username
    receiver.username
  end

  def room_name
    room.name
  end
end
