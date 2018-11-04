class Api::V1::ForecastController < ApplicationController
  def index
    forecast = ForecastFacade.new(params[:location])

    render json: forecast
    # serializer
  end
end
