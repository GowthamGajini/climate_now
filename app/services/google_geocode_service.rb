require 'httparty'

class GoogleGeocodeService
  API_KEY = ENV.fetch('GOOGLE_API_KEY')

  def initialize(lat, lng)
    @lat = lat
    @lng = lng
  end

  def call
    url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=#{@lat},#{@lng}&key=#{API_KEY}"

    response = HTTParty.get(url)
    return nil unless response.code == 200

    results = response.parsed_response["results"]
    return nil unless results && results.any?

    zipcode = nil
    results.each do |result|
      result["address_components"].each do |comp|
        if comp["types"].include?("postal_code")
          zipcode = comp["long_name"]
          break
        end
      end
      break if zipcode
    end

    return zipcode
  end
end
