require 'rails_helper'

describe DarkSkyService do
  latitude = 39.7392358
  longitude = -104.990251
  subject { DarkSkyService.new(latitude, longitude) }

  it 'exists' do
    expect(subject).to be_a DarkSkyService
  end

  context 'instance methods' do
    context '#weather_forecast' do
      it 'returns a hash with weather data' do
        raw_weather_data = subject.weather_forecast

        expect(raw_weather_data).to be_a Hash
        expect(raw_weather_data).to have_key :currently
        expect(raw_weather_data).to have_key :daily
        expect(raw_weather_data).to have_key :hourly
      end
    end
  end
end
