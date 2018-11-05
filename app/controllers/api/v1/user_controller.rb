class Api::V1::UserController < ApplicationController
  def create
    user = User.new(user_params)
    saved_user = user.save
    render json: saved_user, status: 201
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
