class OpenweatherApiService
  include HTTParty
  base_uri 'https://api.openweathermap.org/data/2.5'

  def initialize(lat, long)
    @lat = lat
    @long = long
  end

  def week_city_weather
    week = city_weather['daily']

    week.map do |day|
      { min: day['temp']['min'], max: day['temp']['max'] }
    end
  end

  def city_weather
    self.class.get("/onecall?lat=#{@lat}&lon=#{@long}&units=metric&exclude=hourly,minutely,alerts&appid=a5a47c18197737e8eeca634cd6acb581")
  end
end
