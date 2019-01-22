class Airport < ApplicationRecord
  has_many :origin_airports
  has_many :origin_deals, through: :origin_airports, source: :deal

  has_many :destination_airports
  has_many :destination_deals, through: :destination_airports, source: :deal

  def all_deals
    self.origin_deals + self.destination_deals
  end

  def self.iata(code)
    self.find_by(iata:code.upcase)
  end
  
  def self.import_from_gem(gem_airport)
    a = gem_airport # shorter code

    if self.find_by(iata: a.iata)
      puts %("#{a.iata} already exists.")
    else 
      puts %(Importing "##{a.iata}"...)
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
      puts "Airport.count = #{Airport.count}"
    end
  end

  def self.import_all_from_gem
    # Airports class comes from the Gem!
    Airports.all.each { |a| self.import_from_gem(a) }
  end

  def self.update_gem_data_and_import
    # TO DO
  end
  
end


