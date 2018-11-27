require 'rails_helper'

describe 'GET /api/v1/favorites' do
  it 'returns a JSON response with a listing of the favorite locations' do
    user = User.create(password: "password", email: "myemail@so.com", api_key: "jgn983hy48thw9begh98h4539h4", id: 1)

    favorite_location_1 = Favorite.create(location: "Denver, CO", user_id: 1)
    favorite_location_2 = Favorite.create(location: "Golden, CO", user_id: 1)

    api_key_params = { api_key: "jgn983hy48thw9begh98h4539h4"}

    get '/api/v1/favorites', params: api_key_params

    expect(response.status).to eq 200

    listing = JSON.parse(response.body, symbolize_names: true)

    expect(listing[0]).to have_key(:location)
    expect(listing[0]).to have_key(:current_weather)
  end

  it 'returns 401 (Unauthorized) if no API key' do
    user = User.create(password: "password", email: "myemail@so.com", api_key: "jgn983hy48thw9begh98h4539h4", id: 1)

    get '/api/v1/favorites'

    expect(response.status).to eq 401
  end

  it 'returns 401 (Unauthorized) if API key is incorrect' do
    user = User.create(password: "password", email: "myemail@so.com", api_key: "777hy48thw9begh98h4539h4777")

    listing_favorite_params = { api_key: "jgn983hy48thw9begh98h4539h4" }

    get "/api/v1/favorites", params: listing_favorite_params

    expect(response.status).to eq 401
  end
end



# Content-Type: application/json
# Accept: application/json
# body:
#
# {
#   "api_key": "jgn983hy48thw9begh98h4539h4"
# }
# Requirements:
#
# API key must be sent
# If no API key or an incorrect key is provided return 401 (Unauthorized)'
#
# Response:
#
# status: 200
# body:
# [
#   {
#     "location": "Denver, CO",
#     "current_weather": {
#       # This can vary but try to keep it consistent with the
#       # structure of the response from the /forecast endpoint
#     },
#     "location": "Golden, CO",
#     "current_weather": {
#        {...}
#     }
#   }
# ]
