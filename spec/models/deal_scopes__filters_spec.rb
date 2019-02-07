require 'rails_helper'

describe "Deal scope methods" do

  describe ".from_airport" do
    it "returns deals from the given airport" do
      from_dca = dummy_deal
      from_nrt = dummy_deal_from Airport.iata("NRT")
      expect(from_nrt.origins.first.iata).to eq "NRT" 
      dca = Airport.iata("DCA")
      deals = Deal.from_airport dca
      expect(deals).to include from_dca
      expect(deals).to_not include from_nrt
      expect(deals.class.name).to eq "ActiveRecord::Relation"
    end
  end

  describe ".to_region" do
      
    let(:to_europe) { dummy_deal_to Airport.iata("CDG")}
    let(:to_asia) { dummy_deal_to Airport.iata("BKK")}
    let(:deals_to_europe) { Deal.to_region Region.find_by(name: "Europe")}
    
    it "returns deals to the given region" do
      expect(deals_to_europe).to include to_europe  
      expect(deals_to_europe).to_not include to_asia
    end

    it "can be chained" do
      to_europe
      to_asia
      expect(deals_to_europe.from_airport "DCA").to include to_europe
      expect(Deal.from_airport("DCA").to_region(Region.find_by(name:"Europe"))).to include to_europe
    end
  end

  describe ".for_vacation" do
    let (:good_deal) {dummy_deal}
    let (:bad_deal) {dummy_deal.tap {|d| 
        d.start_date = Date.new(2008,1,1)
        d.end_date = Date.new(2008,2,1)
        d.save
      }
    }
    let (:vacation) {Vacation.new(name:"Whatever", start_date: good_deal.start_date, end_date: good_deal.end_date)}
    let (:deals) {Deal.for_vacation vacation}

    it "returns deals to the given region" do
      expect(deals).to include good_deal
      expect(deals).to_not include bad_deal
      expect(deals.class.name).to eq "ActiveRecord::Relation"
    end

    it "can be chained" do
      expect(deals.to_region good_deal.region).to include good_deal
      expect(Deal.to_region(good_deal.region).for_vacation(vacation)).to include good_deal
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
      deals = Deal.from_airports airports
      expect(deals).to match [from_dca_and_lax, from_iad_and_lax]  
      expect(deals).to_not include from_ny  
      expect(deals.class.name).to eq "ActiveRecord::Relation"
    end
  end

  describe ".from_regions (plural)" do
    it "returns deals from an array of regions" do
      asia_deal = dummy_deal_to Airport.iata("BKK")
      africa_deal = dummy_deal_to Airport.iata("JHB")
      eur_deal = dummy_deal_to Airport.iata("CDG")
  
      regions = [Region.find_by(name:"Asia"), Region.find_by(name:"Africa")]
      deals = Deal.to_regions regions
      expect(deals).to match [asia_deal, africa_deal]
      expect(deals).to_not include [eur_deal]
      expect(deals.class.name).to eq "ActiveRecord::Relation"
    end
  end

  describe ".for_vacations" do
    it "returns deals that match an array of vacations" do
      dec_vac = Vacation.create(name:"December 2019", start_date:Date.new(2019,12,1), end_date:Date.new(2020,12,31))
      oct_vac = Vacation.create(name:"October 2019", start_date:Date.new(2019,10,1), end_date:Date.new(2020,10,31))
      march_vac = Vacation.create(name:"March 2019", start_date:Date.new(2019,3,1), end_date:Date.new(2020,3,31))
      vacations = [dec_vac, oct_vac, march_vac]

      jan_deal = dummy_deal_for(month_no:1)
      march_deal = dummy_deal_for(month_no:3)
      oct_deal = dummy_deal_for(month_no:10)
      deals = Deal.for_vacations vacations
      expect(deals).to include march_deal
      expect(deals).to include oct_deal
      expect(deals).to_not include jan_deal
      expect(deals.class.name).to eq "ActiveRecord::Relation"
    end
  end
end