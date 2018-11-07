require 'rails_helper'

describe 'GET /api/v1/backgrounds?location=denver,co' do
  it 'returns a JSON response with image data for a location' do

    get '/api/v1/backgrounds?location=denver,co'

    expect(response.status).to eq 200

    image = JSON.parse(response.body, symbolize_names: true)

    expect(image).to have_key(:data)
    expect(image[:data]).to have_key(:id)
    expect(image[:data]).to have_key(:type)
    expect(image[:data]).to have_key(:attributes)
    expect(image[:data][:attributes][:city_image]).to have_key(:city_id)
    expect(image[:data][:attributes][:city_image]).to have_key(:city_title)
    expect(image[:data][:attributes][:city_image]).to have_key(:city_url)
    expect(image[:data][:attributes][:city_image]).to have_key(:city_short_url)
  end
end
