require_relative 'airport/importing_utilities'

class Airport < ApplicationRecord
  has_many :origin_airports
  has_many :origin_deals, through: :origin_airports, source: :deal

  has_many :destination_airports
  has_many :destination_deals, through: :destination_airports, source: :deal

  belongs_to :state

  validates :iata, uniqueness: true

  def all_deals
    self.origin_deals + self.destination_deals
  end

  def self.iata(code)
    self.find_by(iata:code.upcase)
  end

  def region
    continent = Ravibhim::Continents::get_continent(self.country)
    if country_region = Region.find_by(name: self.country) 
      country_region
    elsif continent_region = Region.find_by(name: continent)
      continent_region
    elsif self.country == "United States"
      begin
        self.state&.region
      rescue => exception
        nil
      end
    end
  end

end


