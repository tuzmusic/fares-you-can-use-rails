require 'rails_helper'

describe "Deal scope methods" do

  describe ".from_airport" do
    it "returns deals from the given airport" do
      from_dca = dummy_deal
      from_nrt = dummy_deal_from Airport.iata("NRT")
      expect(from_nrt.origins.first.iata).to eq "NRT" 
      dca = Airport.iata("DCA")
      expect(Deal.from_airport dca).to include from_dca
      expect(Deal.from_airport dca).to_not include from_nrt
    end
  end

  describe ".to_region" do
    it "returns deals to the given region" do
      to_europe = dummy_deal_to Airport.iata("CDG")
      expect(Deal.to_region Region.find_by(name: "Europe")).to include to_europe  

      to_asia = dummy_deal_to Airport.iata("BKK")
      expect(Deal.to_region Region.find_by(name: "Europe")).to_not include to_asia
    end
  end

  describe ".for_vacation" do
    it "returns deals to the given region" do
      deal = dummy_deal
      bad_deal = dummy_deal.tap {|d| 
        d.start_date = Date.new(2008,1,1)
        d.end_date = Date.new(2008,2,1)
        d.save
      }
      vacation = Vacation.new(name:"Whatever", start_date: deal.start_date, end_date: deal.end_date)

      expect(Deal.for_vacation vacation).to include deal
      expect(Deal.for_vacation vacation).to_not include bad_deal
      
    end
  end

  describe ".from_airports (plural)" do
    it "returns deals from an array of airports" do
      dca = Airport.iata("DCA")
      iad = Airport.iata("IAD")
      bwi = Airport.iata("BWI")
      lax = Airport.iata("LAX")
      
      airports = [dca, iad, bwi]

      from_dca_and_lax = dummy_deal.tap{|d| d.origins = [dca, lax]}
      from_iad_and_lax = dummy_deal.tap{|d| d.origins = [iad, lax]}
      from_ny = dummy_deal.tap{|d| d.origins = d.destinations} # dummy destinations are ny airports

      expect(Deal.from_airports airports).to match [from_dca_and_lax, from_iad_and_lax]  
      expect(Deal.from_airports airports).to_not include from_ny  
    end
  end
end