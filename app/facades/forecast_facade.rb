class ForecastFacade
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def geocode_service
    GoogleGeocodeService.new(location)
  end

  def latitude
    @latitude ||= geocode_service.coordinates[:lat]
  end

  def longitude
    @longitude ||= geocode_service.coordinates[:lng]
  end
end
