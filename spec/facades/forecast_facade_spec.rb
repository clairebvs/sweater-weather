require 'rails_helper'

describe ForecastFacade do
  location = "denver,co"
  subject { ForecastFacade.new(location) }

  it 'exists' do
    expect(subject).to be_a(ForecastFacade)
  end

  context 'instance methods' do
    context '#latitude' do
      it 'returns the latitude for a location' do
        expect(subject.latitude).to eq(39.7392358)
      end
    end

    context '#longitude' do
      it 'returns the longitude for a location' do
        expect(subject.longitude).to eq(-104.990251)
      end
    end

    context '#current_weather' do
      it 'returns all weather forecast data at the current time' do
        expect(subject.current_weather).to be_a Hash
        expect(subject.current_weather).to have_key(:apparentTemperature)
        expect(subject.current_weather).to have_key(:cloudCover)
        expect(subject.current_weather).to have_key(:humidity)
        expect(subject.current_weather).to have_key(:icon)
        expect(subject.current_weather).to have_key(:time)
        expect(subject.current_weather).to have_key(:summary)
        expect(subject.current_weather).to have_key(:precipProbability)
        expect(subject.current_weather).to have_key(:temperature)
        expect(subject.current_weather).to have_key(:windSpeed)
        expect(subject.current_weather).to have_key(:uvIndex)
        expect(subject.current_weather).to have_key(:visibility)
      end
    end

    context '#hourly_weather' do
      it 'returns all weather forecast data every hour' do
        expect(subject.hourly_weather).to be_an Array
        expect(subject.hourly_weather.first).to have_key(:apparentTemperature)
        expect(subject.hourly_weather.first).to have_key(:cloudCover)
        expect(subject.hourly_weather.first).to have_key(:humidity)
        expect(subject.hourly_weather.first).to have_key(:icon)
        expect(subject.hourly_weather.first).to have_key(:time)
        expect(subject.hourly_weather.first).to have_key(:summary)
        expect(subject.hourly_weather.first).to have_key(:precipProbability)
        expect(subject.hourly_weather.first).to have_key(:temperature)
        expect(subject.hourly_weather.first).to have_key(:windSpeed)
        expect(subject.hourly_weather.first).to have_key(:uvIndex)
        expect(subject.hourly_weather.first).to have_key(:visibility)
      end
    end

    context '#daily_weather' do
      it 'returns all weather forecast data for the next days' do
        expect(subject.daily_weather).to be_a DailyWeather
      end
    end
  end
end
