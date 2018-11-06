class ForecastFacade
  def initialize(location)
    @location = location
  end

  def current_weather
    @current_weather ||= dark_sky_service.weather_forecast[:currently]
  end

  def hourly_weather
    @hourly_weather ||= dark_sky_service.weather_forecast[:hourly][:data]
  end

  def daily_weather
    @daily_weather ||= dark_sky_service.weather_forecast[:daily][:data]
  end

  def latitude
    @latitude ||= geocode_service.coordinates[:lat]
  end

  def longitude
    @longitude ||= geocode_service.coordinates[:lng]
  end

  private
  attr_reader :location

  def location_hash
    split_location = location.split(",")
    { city: split_location[0].capitalize,
      state: split_location[1].upcase
    }
  end

  def dark_sky_service
    DarkSkyService.new(latitude, longitude)
  end

  def geocode_service
    GoogleGeocodeService.new(location)
  end
end
