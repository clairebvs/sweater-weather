class BackgroundImageFacadeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :city_image

  set_id :location
end
