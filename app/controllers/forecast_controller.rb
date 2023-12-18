class ForecastController < ApplicationController
  def index
    city = cities_params[:city]
    render json: ForecastService.new.weather(city).to_json
  end

  private

  def cities_params
    params.permit(:city)
  end
end
