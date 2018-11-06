class Api::V1::SessionController < ApplicationController
  def create
    render json: UserSerializer.new(find_user), status: 200
  end

  private
  def find_user
    @find_user ||= User.find_by_email(session_params[:email])
  end

  def session_params
    params.permit(:email, :password)
  end
end
