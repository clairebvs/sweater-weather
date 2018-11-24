class Api::V1::FavoriteController < ApplicationController
  def index
    favorite_locations = user(listing_params).favorites.each do |favorite|
      favorite.location
    end

    render json: FavoriteLocation.new(favorite_locations)
  end

  def create
    if favorite_params[:api_key].present? && user(favorite_params).present?
      render json: FavoriteSerializer.new(add_favorite), status: 200
    else
      render status: 401
    end
  end

  private

  def favorite_params
    params.permit(:api_key, :location)
  end

  def listing_params
    params.permit(:api_key)
  end

  def user(params)
    User.find_by_api_key(params[:api_key])
  end

  def add_favorite
    user(favorite_params).favorites.find_or_create_by(location: favorite_params[:location])
  end
end
