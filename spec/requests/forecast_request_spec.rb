require 'rails_helper'

describe "GET /api/v1/forecast?location=denver,co" do
  it "returns a JSON response with weather forecast for the location" do

    get "/api/v1/forecast?location=denver,co"

    expect(response.status).to eq 200

    weather = JSON.parse(response.body, symbolize_names: true)

    expect(weather).to have_key(:data)
    expect(weather[:data]).to have_key(:id)
    expect(weather[:data]).to have_key(:type)
    expect(weather[:data]).to have_key(:attributes)
    expect(weather[:data][:attributes]).to have_key(:current_weather)
    expect(weather[:data][:attributes]).to have_key(:hourly_weather)
    expect(weather[:data][:attributes]).to have_key(:daily_weather)
  end
end
