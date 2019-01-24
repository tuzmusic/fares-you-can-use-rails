require_relative 'airport/utilities'

class Airport < ApplicationRecord
  has_many :deal_origins
  has_many :origin_deals, through: :deal_origins, source: :deal

  has_many :destination_airports
  has_many :destination_deals, through: :destination_airports, source: :deal

  belongs_to :state, optional: true

  validates :iata, uniqueness: true

  def all_deals
    self.origin_deals + self.destination_deals
  end

  def self.iata(code)
    self.find_by(iata:code.upcase)
  end

  def region

    # -- NOTE: --
    # "Countries" with "no continent" (i.e., Russia, Puerto Rico) will create a new Region with the name of that country.
    # Only major commercial US airports have states, other airports will return nil.

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
    else 
      Region.find_or_create(name: self.country)
    end
  end

end


