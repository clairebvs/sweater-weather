class DarkSkyService
  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def weather_forecast
    get_json("/forecast/#{ENV['dark_sky_key']}/#{@latitude},#{@longitude}")
  end

  private

  def conn
    Faraday.new(url: "https://api.darksky.net") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
