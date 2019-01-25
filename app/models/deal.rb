require_relative 'deal/convenience_methods'
require_relative 'deal/utilities'
require_relative 'deal/diagnostics'

class Deal < ApplicationRecord
  has_many :deal_origins, dependent: :destroy
  has_many :origins, through: :deal_origins, source: :airport

  has_many :deal_destinations, dependent: :destroy
  has_many :destinations, through: :deal_destinations, source: :airport
  
  belongs_to :region, optional: true

  after_create do |deal|
    deal.set_region
    deal.posted_date = Date.today
  end

  def region
    Region.find_by(id: region_id) || set_region
  end

  def set_region
    if f = destinations.first 
      update(region: f.region)
      self.region
    end
  end

  def probably_expired?
    posted_date < Date.today - 7 if posted_date
  end

end

