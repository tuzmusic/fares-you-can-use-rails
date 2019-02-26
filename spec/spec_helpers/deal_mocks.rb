module DealMocks
  def dummy_deal 
    deal = Deal.create
    id = deal.id
    deal.update(headline: "A Sample Deal ##{id}",
      description:  "A Sample Description ##{id}",
      start_date: Date.new(2019,6,1),
      end_date: Date.new(2019,7,8),
      origin_ids: [Airport.iata("DCA").id, Airport.iata("BWI").id, Airport.iata("IAD").id],  
      destination_ids: [Airport.iata("EWR").id, Airport.iata("JFK").id, Airport.iata("LGA").id])
    deal
  end

  def dummy_deal_from(airport)
    airport = Airport.iata(airport) if airport.class == String && airport.length == 3
    dummy_deal.tap {|d| d.origin = airport}
  end
  
  def dummy_deal_to(airport)
    airport = Airport.iata(airport) if airport.class == String && airport.length == 3
    dummy_deal.tap {|d| d.destination = airport}
  end

  def dummy_deal_for(month_no:)
    dummy_deal.tap {|d| 
      d.start_date = Date.new(2019,month_no,1)
      d.end_date = Date.new(2019,month_no,30)
      d.save
    }
  end
end