class Airport < ApplicationRecord
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
    puts "Airport.update_gem_data_and_import not yet implemented"
    # TO DO
  end
  
  def self.regionless
    puts "This makes a lot of SQL queries, are you sure you want to proceed? (Enter 'Y' to proceed)."
    if $stdin.gets.trim.downcase == "y"
      Airport.all.select{ |d| d.region == nil}
    end
  end
end

