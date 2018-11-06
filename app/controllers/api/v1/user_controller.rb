class Api::V1::UserController < ApplicationController
  def create
    render json: UserSerializer.new(user), status: 201
  end

  private

  def user
    @user ||= User.create(user_params)
  end

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
