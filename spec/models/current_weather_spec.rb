require 'rails_helper'

describe CurrentWeather do
  let(:current_weather_data) {
                              { time: 1541365485,
                                summary: "Overcast",
                                icon: "cloudy",
                                precipProbability: 0,
                                temperature: 55.33,
                                apparentTemperature: 55.33,
                                humidity: 0.3,
                                windSpeed: 1.84,
                                cloudCover: 0.96,
                                uvIndex: 2,
                                visibility: 8.24,
                              }
                            }

  subject { CurrentWeather.new(current_weather_data) }

  it "exists" do
    expect(subject).to be_a(CurrentWeather)
  end

  context "instance methods" do
    context "#time" do
      it "returns the actual time" do
        expect(subject.time).to eq 1541365485
      end
    end

    context "#summary" do
      it "returns a summary of the current weather" do
        expect(subject.summary).to eq("Overcast")
      end
    end

    context "#icon" do
      it "returns an icon to describe the weather" do
        expect(subject.icon).to eq("cloudy")
      end
    end

    context "#potential_precipitation" do
      it "returns the probability for precipitation" do
        expect(subject.potential_precipitation).to eq(0)
      end
    end

    context "#temperature" do
      it "returns the temperature" do
        expect(subject.temperature).to eq(55.33)
      end
    end

    context "#feels_temperature" do
      it "returns the feels like temperature" do
        expect(subject.feels_temperature).to eq(55.33)
      end
    end

    context "#humidity" do
      it "returns the humidity" do
        expect(subject.humidity).to eq(0.3)
      end
    end

    context "#wind_speed" do
      it "returns the speed of the wind" do
        expect(subject.wind_speed).to eq(1.84)
      end
    end

    context "#cloud_cover" do
      it "returns the cloud coverage" do
        expect(subject.cloud_cover).to eq(0.96)
      end
    end

    context "#uv_index" do
      it "returns the uv index" do
        expect(subject.uv_index).to eq(2)
      end
    end

    context "#visibility" do
      it "returns the visibility" do
        expect(subject.visibility).to eq(8.24)
      end
    end
  end
end
