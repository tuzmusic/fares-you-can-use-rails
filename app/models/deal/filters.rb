class Deal < ApplicationRecord  

  scope :current, -> { where('end_date > ?', Date.today) }

  scope :from_airport, -> (airport) { select {|d| d.origins.include? airport} }
  scope :to_region, -> (region) { where(region: region) }
end