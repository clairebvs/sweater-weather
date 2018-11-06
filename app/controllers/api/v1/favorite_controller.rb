class Api::V1::FavoriteController < ApplicationController
  def create

    render json: favorite, status: 200
  end
end
