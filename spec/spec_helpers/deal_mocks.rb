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
    dummy_deal.tap {|d| d.origin = airport}
  end
  
  def dummy_deal_to(airport)
    dummy_deal.tap {|d| d.destination = airport}
  end
end