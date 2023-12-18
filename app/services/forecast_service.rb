class ForecastService
  def weather(city)
    cities = ReservamosApiService.new(city).cities_info
    cities_weather(cities)
  end

  private

  def cities_weather(cities)
    cities.map do |city|
      {
        city_full_name: "#{city[:city_name]}, #{city[:state]}",
        weather_next_days: city_weather_info(city[:lat].to_f, city[:long].to_f)
      }
    end
  end

  def city_weather_info(lat, long)
    OpenweatherApiService.new(lat, long).week_city_weather
  end
end
