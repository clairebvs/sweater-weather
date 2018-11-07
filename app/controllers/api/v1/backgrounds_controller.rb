class Api::V1::BackgroundsController < ApplicationController
  def show
    background_image = BackgroundImage.new(params[:location])

    render json: BackgroundImageSerializer.new(background_image)
  end
end
