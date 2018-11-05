class CurrentWeather
  attr_reader :time, :summary, :icon, :potential_precipitation, :temperature, :feels_temperature, :humidity, :wind_speed, :cloud_cover, :uv_index, :visibility

  def initialize(current_data)
    @time = current_data[:time]
    @summary = current_data[:summary]
    @icon = current_data[:icon]
    @potential_precipitation = current_data[:precipProbability]
    @temperature = current_data[:temperature]
    @feels_temperature = current_data[:apparentTemperature]
    @humidity = current_data[:humidity]
    @wind_speed = current_data[:windSpeed]
    @cloud_cover = current_data[:cloudCover]
    @uv_index = current_data[:uvIndex]
    @visibility = current_data[:visibility]
  end
end
