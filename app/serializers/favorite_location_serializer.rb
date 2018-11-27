class FavoriteLocationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :current_weather

  set_id :location_hash
end
