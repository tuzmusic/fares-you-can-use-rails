class Deal < ApplicationRecord  
  scope :current, -> { where('end_date > ?', Date.today) }

  scope :from_airport, -> (airport) do
    airport = Airport.iata(airport) if airport.class == String && airport.length == 3
    joins(:origins).where(airports: {id: airport.id}) 
  end

  scope :to_region, -> (region) { region.deals }
  scope :for_vacation, -> (vacation) { vacation.deals }

  scope :from_airports, -> (airports) {joins(:origins).where(airports: {ids: airports.ids}) }
  
  scope :to_regions, -> (regions) { select {|d| regions.include? d.region } }

  scope :for_vacations, -> (vacations) do
    select do |deal|
      vacations.any? { |v| v.deals.include? deal }
    end
  end

end