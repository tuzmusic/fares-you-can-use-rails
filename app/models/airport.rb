class Airport < ApplicationRecord
  has_many :deal_airports
  has_many :deals, through: :deal_airports
  
  def self.import_from_gem(gem_airport)
    a = gem_airport # shorter code
    self.create(name: a.name,
                city: a.city,
                country: a.country,
                iata: a.iata,
                icao: a.icao,
                latitude: a.latitude,
                longitude: a.longitude,
                altitude: a.altitude,
                timezone: a.timezone,
                dst: a.dst)
  end

  def self.import_all_from_gem
    Airports.all.each do |a|
      puts "Importing \"#{a.iata}\"..."
      self.import_from_gem(a)
    end
  end
  
end


