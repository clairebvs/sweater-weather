class FlickrService
  def initialize(location)
    @location = location
  end

  def forecast
    ForecastFacade.new(@location)
  end

  def latitude
    forecast.latitude
  end

  def longitude
    forecast.longitude
  end

  def all_photos
    Flickr.configure do |config|
      config.api_key       = ENV['flickr_key']
      config.shared_secret = ENV['flickr_secret']
    end

    Flickr.photos.search(lat: latitude, lon: longitude)
  end
end
