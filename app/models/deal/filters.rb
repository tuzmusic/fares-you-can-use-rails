class Deal < ApplicationRecord  
  scope :current, -> { where('end_date > ?', Date.today) }

  scope :from_airport, -> (airport) {joins(:origins).where(airports: {id: airport.id}) }
  scope :to_region, -> (region) { region.deals }
  scope :for_vacation, -> (vacation) { vacation.deals }

  scope :from_airports, -> (airports) {joins(:origins).where(airports: {ids: airports.ids}) }
  # scope :from_airports, -> (airports) do
  #   select do |deal|
  #     deal.origins.any? { |origin| airports.include? origin }
  #   end
  # end
  
  scope :to_regions, -> (regions) { select {|d| regions.include? d.region } }

  scope :for_vacations, -> (vacations) do
    select do |deal|
      vacations.any? { |v| v.deals.include? deal }
    end
  end

end