class Airport < ApplicationRecord
  has_many :deal_airports
  has_many :deals, through: :deal_airports
  
  def self.import_from_gem(gem_airport)
    a = gem_airport # shorter code
    new_a = self.find_or_create_by(iata: a.iata)
    new_a.name        = a.name
    new_a.city        = a.city
    new_a.country     = a.country
    new_a.icao        = a.icao
    new_a.latitude    = a.latitude
    new_a.longitude   = a.longitude
    new_a.altitude    = a.altitude
    new_a.timezone    = a.timezone
    new_a.dst         = a.dst
    new_a.save
  end

  def self.import_all_from_gem
    Airports.all.each do |a|
      puts "Importing \"#{a.iata}\"..."
      self.import_from_gem(a)
    end
  end
  
end


