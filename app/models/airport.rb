class Airport < ApplicationRecord
  has_many :deal_airports
  has_many :deals, through: :deal_airports
  
  def self.import_from_gem(gem_airport)
    a = gem_airport # shorter code

    if self.find_by(iata: a.iata)
      puts %("#{a.iata} already exists.")
    else 
      puts %(Importing "#{a.iata}"...)
      new_a = self.create(
        name:      a.name,
        city:      a.city,
        country:   a.country,
        iata:      a.iata,
        icao:      a.icao,
        latitude:  a.latitude,
        longitude: a.longitude,
        altitude:  a.altitude,
        timezone:  a.timezone,
        dst:       a.dst)
      puts "Failed." if not new_a.save
    end
  end

  def self.import_all_from_gem
    Airports.all.each { |a| self.import_from_gem(a) }
  end
  
end


