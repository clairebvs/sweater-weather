class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :current_weather, :hourly_weather, :daily_weather

  set_id :location_hash
end
