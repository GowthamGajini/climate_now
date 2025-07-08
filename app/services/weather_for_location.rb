class WeatherForLocation
  def initialize(location)
    @location = location
  end

  def call
    return { error: "Please enter a location" } if @location.blank?

    zipcode = LocationToZipcodeService.new(@location).call
    return { error: "Location not Found / Invalid" } if zipcode.blank?

    cache_key = "weather_at_zipcode:#{zipcode}"
    from_cache = true

    weather_data = Rails.cache.fetch(cache_key, expires_in: 1.minute) do
      from_cache = false
      WeatherAtZipcodeLocation.new(zipcode).call
    end

    return { error: "Weather Data couldn't be fetched for this location" } if weather_data.blank?

    { weather: weather_data, from_cache: from_cache }
  end
end
