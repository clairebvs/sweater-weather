require 'rails_helper'
describe 'POST /api/v1/favorites' do
  it 'returns a JSON response ' do
    user = User.create(password: "password", email: "myemail@so.com", api_key: "jgn983hy48thw9begh98h4539h4")

    favorite_params = { api_key: "jgn983hy48thw9begh98h4539h4",
                        location: "Denver, CO"
                      }

    post "/api/v1/favorites", params: favorite_params

    expect(response.status).to eq 200

    favorite = JSON.parse(response.body, symbolize_names: true)

    expect(favorite[:data]).to have_key(:id)
    expect(favorite[:data]).to have_key(:type)
    expect(favorite[:data]).to have_key(:attributes)
    expect(favorite[:data][:attributes]).to have_key(:location)
  end
end
