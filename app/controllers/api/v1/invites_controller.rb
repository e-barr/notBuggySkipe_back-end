class Api::V1::InvitesController < ApplicationController

  def destroy
    debugger
    @invite = Invite.find(invite_params[:id])
    @user = User.find(invite_params[:user_id])
    @invite.destroy
    render json: { user: UserSerializer.new(@user) }
  end

  private
  def invite_params
    debugger
    params.require(:invite).permit(:sender_id, :receiver_id, :room_name, :content, :id, :user_id)
  end
end
