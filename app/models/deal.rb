require_relative 'deal/utilities'
require_relative 'deal/diagnostics'

class Deal < ApplicationRecord
  has_many :deal_origins, dependent: :destroy
  has_many :origins, through: :deal_origins, source: :airport

  has_many :deal_destinations, dependent: :destroy
  has_many :destinations, through: :deal_destinations, source: :airport
  
  belongs_to :region, optional: true

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
  end

  def destination_codes
    self.destinations.map(&:iata).join(', ')
  end

  # def region
  #   destinations&.first&.region
  # end

  def probably_expired?
    posted_date < Date.today - 7 if posted_date
  end

end

