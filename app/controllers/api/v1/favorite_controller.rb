class Api::V1::FavoriteController < ApplicationController
  def create
    render json: FavoriteSerializer.new(add_favorite), status: 200
  end

  private
  def favorite_params
    params.permit(:api_key, :location)
  end

  def user
    User.find_by_api_key(favorite_params[:api_key])
  end

  def add_favorite
    user.favorites.find_or_create_by(location: favorite_params[:location])
  end
end
