class FavoriteLocationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :current_weather
end
