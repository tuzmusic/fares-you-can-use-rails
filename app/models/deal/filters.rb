class Deal < ApplicationRecord  
  scope :current, -> { where('end_date > ?', Date.today) }

  scope :group_by_posted, -> { group_by(&:posted_date) }


  # ------ SINGULAR ------

  scope :from_airport, -> (airport) do
    airport = Airport.iata(airport) if airport.class == String && airport.length == 3
    joins(:origins).where(airports: {id: airport.id}) 
  end

  scope :to_region, -> (region) { region.deals }
  
  scope :for_vacation, -> (vacation) { 
    vacation.deals 
  }

  scope :during_vacation, -> (vacation) { 
    Deal.where.not('start_date >= ?', vacation.end_date).where.not('end_date <= ?', vacation.start_date)
  }

  # ------ PLURAL ------
  
  scope :from_airports, -> (airports) { 
    joins(:origins).where(airports: {id: airports.map(&:id)}) 
  } 

  scope :to_regions, -> (regions) { joins(:region).where(regions: {id: regions.map(&:id)}) } 

  scope :for_vacations, -> (vacations) do
    select do |deal|
      vacations.any? do |v| 
        v.deals.include? deal 
      end
    end
  end

end