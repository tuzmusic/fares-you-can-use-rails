require_relative 'airport/utilities'

class Airport < ApplicationRecord
  has_many :deal_origins
  has_many :origin_deals, through: :deal_origins, source: :deal

  has_many :deal_destinations
  has_many :destination_deals, through: :deal_destinations, source: :deal

  belongs_to :state, optional: true
  belongs_to :region, optional: true

  validates :iata, uniqueness: true

  def all_deals
    self.origin_deals + self.destination_deals
  end

  def self.iata(code)
    self.find_by(iata:code.upcase)
  end

  def region
    if region_id
      Region.find(region_id)
    else
      region = set_region
    end
  end

  def region=(reg)
    update(region_id: reg.id)
  end

  def set_region
    continent = Ravibhim::Continents::get_continent(self.country)

    state&.region ||                              # Only major commercial US airports have states
    Region.find_by(name: continent) ||            # Region = Continent for airports outside the US
    Region.find_or_create_by(name: self.country)  # Fallback: region = country 
  end
end


