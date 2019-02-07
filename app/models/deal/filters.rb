class Deal < ApplicationRecord  
  scope :current, -> { where('end_date > ?', Date.today) }


  # ------ SINGULAR ------

  scope :from_airport, -> (airport) do
    airport = Airport.iata(airport) if airport.class == String && airport.length == 3
    joins(:origins).where(airports: {id: airport.id}) 
  end

  scope :to_region, -> (region) { region.deals }
  
  scope :for_vacation, -> (vacation) { vacation.deals }

  # ------ PLURAL ------
  
  scope :from_airports, -> (airports) {joins(:origins).where(airports: {id: airports.map(&:id)}) } 

  scope :to_regions, -> (regions) {joins(:region).where(regions: {id: regions.map(&:id)}) } 

  scope :for_vacations, -> (vacations) do
    select do |deal|
      vacations.any? { |v| v.deals.include? deal }
    end
  end


end