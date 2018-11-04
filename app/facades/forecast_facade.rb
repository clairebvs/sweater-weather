class ForecastFacade
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def current_weather
    @current_weather ||= dark_sky_service.weather_forecast do |current_data|
      CurrentWeather.new(current_data)
    end
  end

  def latitude
    @latitude ||= geocode_service.coordinates[:lat]
  end

  def longitude
    @longitude ||= geocode_service.coordinates[:lng]
  end

  private

  def dark_sky_service
    DarkSkyService.new(@latitude, @longitude)
  end

  def geocode_service
    GoogleGeocodeService.new(location)
  end
end
