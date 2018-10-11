class Api::V1::UsersController < ApplicationController

  def create
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password, :city, :country, :image_url)
  end
end
