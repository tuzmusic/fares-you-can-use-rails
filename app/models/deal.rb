class Deal < ApplicationRecord
  has_many :deal_airports
  has_many :airports, through: :deal_airports


  def airport=(iata_code)
    if airport = Airport.find_by(iata: iata_code)
      self.airports = [airport]
    end
  end
  
  def airport_codes=(iata_codes)
    airports = []
    iata_codes.each do |code|
      if airport = Airport.find_by(iata: code)
        airports << airport
      end
    end
    self.airports = airports
  end
  
end

