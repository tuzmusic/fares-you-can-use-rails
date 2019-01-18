class Deal < ApplicationRecord
  has_many :origin_airports, dependent: :destroy
  has_many :origins, through: :origin_airports, source: :airport

  has_many :destination_airports, dependent: :destroy
  has_many :destinations, through: :destination_airports, source: :airport

  def airport=(iata_code)
    if airport = Airport.find_by(iata: iata_code)
      self.airports = [airport]
    end
  end
  
  def origin_codes=(comma_separated_string)
    airports = []
    iata_codes = comma_separated_string.split(', ') 
    iata_codes.each do |code|
      if airport = Airport.find_by(iata: code)
        airports << airport
      end
    end
    self.origins = airports
  end
  
end

