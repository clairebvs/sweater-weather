class GoogleGeocodeService

  def initialize(location)
    @location = location
  end

  def coordinates
    JSON.parse(response.body, symbolize_names: true)[:results][0][:geometry][:location]
  end

  private
  def response
    conn.get("/maps/api/geocode/json?address=#{@location}")
  end

  def conn
    Faraday.new(url: "https://maps.googleapis.com") do |faraday|
      faraday.params["key"] = ENV['geocode_key']
      faraday.adapter Faraday.default_adapter
    end
  end
end
