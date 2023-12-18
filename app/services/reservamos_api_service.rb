class ReservamosApiService
  include HTTParty
  base_uri 'https://search.reservamos.mx'

  def initialize(city)
    @options = { query: { q: city } }
  end

  def cities_info
    fetch_cities.map do |city|
      {
        city_name: city['city_name'],
        state: city['state'],
        lat: city['lat'],
        long: city['long']
      }
    end
  end

  private

  def fetch_cities
    cities_only(fetch_places)
  end

  def fetch_places
    self.class.get('/api/v2/places', @options)
  end

  def cities_only(response)
    response.map do |entry|
      entry if result_type_city?(entry['result_type'])
    end.compact
  end

  def result_type_city?(type)
    type == 'city'
  end
end
