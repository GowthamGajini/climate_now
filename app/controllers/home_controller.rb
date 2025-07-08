class HomeController < ApplicationController
  def index
  end

  def search
    @location = params[:location]
    if @location.blank?
      @error_message = "Please enter a location"
      @temperature = nil
      @from_cache = false
    end

    respond_to do |format|
      format.turbo_stream
      format.html { render partial: "search_result" }
    end
  end


  def fetch_weather(zipcode)
  zipcode = '500084'
  api_key = "4a04d8ee1972fe2925bd03b9e499a2ec"
  url = "https://api.openweathermap.org/data/2.5/weather?zip=#{zipcode},in&appid=#{api_key}&units=metric"
  resp = HTTParty.get(url)
  JSON.parse(resp.body)
end
end
