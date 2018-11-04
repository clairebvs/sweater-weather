require 'rails_helper'

describe "GET /api/v1/forecast?location=denver,co" do
  xit "returns a JSON response with weather forecast for the location" do

    get "/api/v1/forecast?location=denver,co"

    expect(response.status).to eq 200

    weather = JSON.parse(response.body, symbolize_names: true)

    expect(weather).to have_key(:forecast)
    expect(weather[:forecast]).to have_key(:current_weather)
    expect(weather[:forecast]).to have_key(:hourly_weather)
    expect(weather[:forecast]).to have_key(:day_weather)
  end
end
