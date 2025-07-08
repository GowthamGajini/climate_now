require "httparty"

class GooglePlacesService
  API_KEY = ENV.fetch("GOOGLE_API_KEY")

  def initialize(search_text)
    @search_text = search_text
  end

  def call
    url = "https://places.googleapis.com/v1/places:searchText"

    headers = {
      "Content-Type" => "application/json",
      "X-Goog-Api-Key" => API_KEY,
      "X-Goog-FieldMask" => "*"
    }

    body = {
      textQuery: @search_text
    }

    response = HTTParty.post(
      url,
      headers: headers,
      body: body.to_json
    )

    return nil unless response.code == 200

    places = response.parsed_response["places"]
    return nil unless places && places.any?

    lat = places[0]["location"]["latitude"]
    lng = places[0]["location"]["longitude"]
    { lat: lat, lng: lng }
  end
end
