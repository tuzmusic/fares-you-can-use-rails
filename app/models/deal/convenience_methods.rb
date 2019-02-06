class Deal < ApplicationRecord
  # ------ WRITER METHODS --------
  def origin=(airport)
    update(origins:[airport])
  end
  
  def destination=(airport)
    update(destinations:[airport])
    set_region
  end

  def self.airports_from_string(comma_separated_string)
    airports = []
    iata_codes = comma_separated_string.split(', ') 
    iata_codes.each do |code|
      if airport = Airport.find_by(iata: code)
        airports << airport
      end
    end
    airports
  end

  def origin_codes=(comma_separated_string)
    self.origins = Deal.airports_from_string(comma_separated_string)
  end

  def origin_codes
    self.origins.map(&:iata).join(', ')
  end

  def destination_codes=(comma_separated_string)
    self.destinations = Deal.airports_from_string(comma_separated_string)
    set_region
  end

  def destination_codes
    self.destinations.map(&:iata).join(', ')
  end

end

