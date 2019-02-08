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
    let (:dca) { Airport.iata("DCA")}
    let (:iad) { Airport.iata("IAD")}
    let (:bwi) { Airport.iata("BWI")}
    let (:lax) { Airport.iata("LAX")}
    let (:airports)  {[dca, iad, bwi]}
    let (:from_dca_and_lax) { dummy_deal.tap{|d| d.origins = [dca, lax]}}
    let (:from_iad_and_lax) { dummy_deal.tap{|d| d.origins = [iad, lax]}}
    let (:from_ny) { dummy_deal.tap{|d| d.origins = d.destinations} }
    let (:deals) { Deal.from_airports airports}

    it "returns deals from an array of airports" do
      expect(deals).to match [from_dca_and_lax, from_iad_and_lax]  
      expect(deals).to_not include from_ny  
      expect(deals.class.name).to eq "ActiveRecord::Relation"
    end

    it "can be chained" do
      from_dca_and_lax; from_iad_and_lax; from_ny
      expect(deals.to_region deals.first.region).to include deals.first
    end
  end

  describe ".to_regions (plural)" do
    let(:asia_deal) { dummy_deal_to Airport.iata("BKK")}
    let(:africa_deal) { dummy_deal_to Airport.iata("GCJ")}
    let(:eur_deal) { dummy_deal_to Airport.iata("CDG")}
    let(:regions) { [Region.find_by(name:"Asia"), Region.find_by(name:"Africa")]}
    let(:deals) { Deal.to_regions regions}

    it "returns deals from an array of regions" do
      asia_deal; africa_deal; eur_deal; regions
      expect(deals).to match [asia_deal, africa_deal]
      expect(deals).to_not include [eur_deal]
      expect(deals.class.name).to eq "ActiveRecord::Relation"
    end
  end

  describe ".for_vacations (plural)" do
    let(:dec_vac) { Vacation.create(name:"December 2019", start_date:Date.new(2019,12,1), end_date:Date.new(2020,12,31)) }
    let(:oct_vac) { Vacation.create(name:"October 2019", start_date:Date.new(2019,10,1), end_date:Date.new(2020,10,31)) }
    let(:march_vac) { Vacation.create(name:"March 2019", start_date:Date.new(2019,3,1), end_date:Date.new(2020,3,31)) }
    let(:vacations) { [dec_vac, oct_vac, march_vac] }
    let(:jan_deal) { dummy_deal_for(month_no:1) }
    let(:march_deal) { dummy_deal_for(month_no:3) }
    let(:oct_deal) { dummy_deal_for(month_no:10) }
    let(:deals) { Deal.for_vacations vacations }

    it "returns deals that match an array of vacations" do
      dec_vac; oct_vac; march_vac; vacations; jan_deal; march_deal; oct_deal
      expect(deals).to include march_deal
      expect(deals).to include oct_deal
      expect(deals).to_not include jan_deal
      expect(deals.class.name).to eq "ActiveRecord::Relation"
    end
  end
end