require 'httparty'

class WeatherAtZipcodeLocation
  API_KEY = ENV.fetch('OPENWEATHER_API_KEY')

  def initialize(zipcode)
    @zipcode = zipcode
  end

  def call
    url = "https://api.openweathermap.org/data/2.5/weather?zip=#{@zipcode},in&appid=#{API_KEY}&units=metric"
    resp = HTTParty.get(url)
    return nil unless resp.code == 200

    data = JSON.parse(resp.body)
    {
      temperature: data.dig("main", "temp"),
      description: data.dig("weather", 0, "description")
    }
  end
end
