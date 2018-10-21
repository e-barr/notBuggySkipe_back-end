class Api::V1::InvitesController < ApplicationController

  def destroy
    @invite = Invite.find(invite_params[:id])
    @user = User.find(invite_params[:user_id])
    @invite.destroy
    render json: { user: UserSerializer.new(@user) }
  end

  def create
    @meeting_room = MeetingRoom.create(name: invite_params[:room_name])
    @invite = Invite.create(sender_id: invite_params[:sender_id], receiver_id: invite_params[:receiver_id], room_id: @meeting_room.id, content: invite_params[:content])
    @user = User.find(invite_params[:sender_id])

    if @invite
      render json: { user: UserSerializer.new(@user) }
    else
      render json: { error: 'Failed to send invite.' }, status: :not_acceptable
    end
  end

  private
  def invite_params
    params.require(:invite).permit(:sender_id, :receiver_id, :room_name, :content, :id, :user_id)
  end
end
