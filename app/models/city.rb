class City < ActiveRecord::Base
  validates :lat, :lon, presence: true
  
  before_validation :geocode
  
  def weather
    if self.lat
      ForecastIO.forecast(self.lat, self.lon).currently.icon
    else
      'unknown'
    end
  end
  
  private
  
  def geocode
    places = Nominatim.search.city(self.name).limit(1)
    if places.first
      self.lat = places.first.lat
      self.lon = places.first.lon
    end
  end
end
