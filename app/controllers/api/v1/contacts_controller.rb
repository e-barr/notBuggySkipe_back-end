class Api::V1::ContactsController < ApplicationController

  def destroy
    @contact = Contact.find(contact_params[:id])
    @user = User.find(@contact.user_1.id)
    Contact.delete_contact(@contact.id)
    render json: { user: UserSerializer.new(@user) }
  end

  private
  def contact_params
    params.require(:contact).permit(:user_1, :user_2, :id)
  end
end
