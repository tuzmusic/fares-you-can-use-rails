class Deal < ApplicationRecord  

  scope :current, -> { where('end_date > ?', Date.today) }

  scope :from_airport, -> (airport) { select {|d| d.origins.include? airport} }
  scope :to_region, -> (region) { region.deals }
  scope :for_vacation, -> (vacation) { vacation.deals }
end