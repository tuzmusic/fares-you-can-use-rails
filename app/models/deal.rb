class Deal < ApplicationRecord
  has_many :deal_airports
  has_many :airports, through: :deal_airports  

  def airport=(iata_code)
    if airport = Airport.find_by(iata: iata_code)
      self.airports = [airport]
    end
  end
end
