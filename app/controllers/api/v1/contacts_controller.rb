class Api::V1::ContactsController < ApplicationController

  def destroy
    @contact = Contact.find(contact_params[:id])
    @user = User.find(@contact.user_1.id)
    Contact.delete_contact(@contact.id)
    render json: { user: UserSerializer.new(@user) }
  end

  def create
    @user_1 = User.find(contact_params[:user_1_id])
    @user_2 = User.find(contact_params[:user_2_id])
    @contact = Contact.make_new_contact(@user_1.id, @user_2.id)

    if @contact
      render json: { user: UserSerializer.new(@user) }
    else
      render json: { error: 'Failed to add to contacts.' }, status: :not_acceptable
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:user_1, :user_2, :id, :user_1_id, :user_2_id)
  end
end
