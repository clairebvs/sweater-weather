require 'rails_helper'
describe 'POST /api/v1/favorites' do
  it 'returns a JSON response ' do
    user = create(:user)

    post "/api/v1/favorites"

    expect(response.status).to eq 200

    favorite = JSON.parse(response.body, symbolize_names: true)

    expect(favorite[:data][:attributes][:api_key]).to eq(user.api_key)

    expect(favorite[:data]).to have_key(:id)
    expect(favorite[:data]).to have_key(:type)
    expect(favorite[:data]).to have_key(:attributes)
    expect(favorite[:data][:attributes]).to have_key(:api_key)
    expect(favorite[:data][:attributes]).to have_key(:location)
  end
end

# body:
# {
#   "location": "Denver, CO", # If you decide to store cities in your database you can send an id if you prefer
#   "api_key": "jgn983hy48thw9begh98h4539h4"
# }
