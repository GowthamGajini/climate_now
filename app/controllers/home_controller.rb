class HomeController < ApplicationController
  def index
  end

  def search
    result = WeatherForLocation.new(params[:location]).call

    @error_message = result[:error]
    @weather_data = result[:weather]
    @cache = result[:from_cache]

    respond_to do |format|
      format.turbo_stream
      format.html { render partial: "search_result" }
    end
  end
end
