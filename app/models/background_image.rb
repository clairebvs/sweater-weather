class BackgroundImage
  def initialize(location)
    @location = location
  end

  def city_image
    city_photo = photos.sample

    { city_id: city_photo.id,
      city_title: city_photo.title,
      city_url: city_photo.url,
      city_short_url: city_photo.short_url }
  end

  private

  attr_reader :location

  def flickr_service
    FlickrService.new(location)
  end

  def photos
    flickr_service.all_photos
  end
end
