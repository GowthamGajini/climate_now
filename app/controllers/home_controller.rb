class HomeController < ApplicationController
  def index
  end

  def search
  end

  def fetch_weather(zipcode)
  zipcode = '500084'
  api_key = "4a04d8ee1972fe2925bd03b9e499a2ec"
  url = "https://api.openweathermap.org/data/2.5/weather?zip=#{zipcode},in&appid=#{api_key}&units=metric"
  resp = HTTParty.get(url)
  JSON.parse(resp.body)
end
end
