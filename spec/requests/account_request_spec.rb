require 'rails_helper'

describe 'POST /api/v1/users' do
  it 'returns a JSON response with an api_key' do
    user_params = {
                    email: "whatever@example.com",
                    password: "password",
                    password_confirmation: "password"
                  }

    post "/api/v1/users", params: user_params

    expect(response.status).to eq 201

    account = JSON.parse(response.body, symbolize_names: true)

    expect(account).to have_key(:data)
    expect(account[:data]).to have_key(:id)
    expect(account[:data]).to have_key(:type)
    expect(account[:data]).to have_key(:attributes)
    expect(account[:data][:attributes]).to have_key(:api_key)
  end
end
