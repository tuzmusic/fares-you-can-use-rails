class Deal < ApplicationRecord  

  scope :current, -> { where('end_date > ?', Date.today) }

  scope :from_airport, -> (airport) { select {|d| d.origins.include? airport} }
  scope :to_region, -> (region) { region.deals }
  scope :for_vacation, -> (vacation) { vacation.deals }

  scope :from_airports, -> (airports) do
    select do |deal|
      deal.origins.any? { |origin| airports.include? origin }
    end
  end

  scope :for_regions, -> (regions) { select {|d| regions.include? d.region } }
end