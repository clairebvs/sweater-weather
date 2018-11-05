class BackgroundImageFacade
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

  def city_image
    Flickr.configure do |config|
      config.api_key       = ENV['flickr_key']
      config.shared_secret = ENV['flickr_secret']
    end

    photos = Flickr.photos.search(lat: latitude, lon: longitude)
    city_photo = photos.sample

    { city_id: city_photo.id,
      city_title: city_photo.title,
      city_url: city_photo.url,
      city_short_url: city_photo.short_url }
  end
end
