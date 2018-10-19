class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized?, only: [:create]

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.create(user_params)

    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'Failed to create user. Please ensure all fields are filled, and your username and email are unique.' }, status: :not_acceptable
    end
  end

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def update
    @user = User.find(user_params[:id])

    if @user.update(user_params)
      render json: { user: UserSerializer.new(@user)}, status: :accepted
    else
      render json: { error: 'update to user failed' }, status: :not_acceptable
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :password, :city, :country, :image_url, :meeting_id, :id)
  end
end
