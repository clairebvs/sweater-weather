require 'rails_helper'

describe 'POST /api/v1/sessions' do
  it 'returns a JSON response with an api_key' do
    user = create(:user)

    user_params = {
                    email: "whatever@example.com",
                    password: "password",
                  }

    post "/api/v1/sessions", params: user_params

    expect(response.status).to eq 200

    login = JSON.parse(response.body, symbolize_names: true)

    expect(login[:data][:attributes][:api_key]).to eq(user.api_key)

    expect(login).to have_key(:data)
    expect(login[:data]).to have_key(:id)
    expect(login[:data]).to have_key(:type)
    expect(login[:data]).to have_key(:attributes)
    expect(login[:data][:attributes]).to have_key(:api_key)
  end
end
