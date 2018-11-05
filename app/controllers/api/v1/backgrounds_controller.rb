class Api::V1::BackgroundsController < ApplicationController
  def show
    background_image = BackgroundImageFacade.new(params[:location])

    render json: background_image
  end
end
