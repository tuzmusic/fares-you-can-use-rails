require_relative 'deal/convenience_methods'
require_relative 'deal/utilities'
require_relative 'deal/diagnostics'

class Deal < ApplicationRecord
  has_many :deal_origins, dependent: :destroy
  has_many :origins, through: :deal_origins, source: :airport

  has_many :deal_destinations, dependent: :destroy
  has_many :destinations, through: :deal_destinations, source: :airport
  
  belongs_to :region, optional: true

  # def region
  #   destinations&.first&.region
  # end

  def probably_expired?
    posted_date < Date.today - 7 if posted_date
  end

end

