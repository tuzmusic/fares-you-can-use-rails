require 'rails_helper'

describe "User deals/preferences" do

  let(:user) { create_user }

  let(:dca) { Airport.iata("DCA") }
  let(:bwi) { Airport.iata("BWI") }
  let(:asia) { Region.find_by(name: "Asia") }

  let(:good_asia_deal) { Deal.create(
      headline: "Deal to Asia in June",
      description: "Blah blah blah",
      start_date: Date.new(2019,6,1),
      end_date: Date.new(2019,7,8),
      instructions: "Google it! It's everywhere!",
      origin_ids: [Airport.iata("DCA").id, Airport.iata("BWI").id, Airport.iata("IAD").id],  
      destination_ids: [Airport.iata("NRT").id, Airport.iata("BKK").id }
  end }

  let(:good_single_origin_deal) { Deal.create(
      headline: "Deal to Asia in June",
      description: "Blah blah blah",
      start_date: Date.new(2019,6,1),
      end_date: Date.new(2019,7,8),
      instructions: "Google it! It's everywhere!",
      origin_ids: [Airport.iata("DCA").id],  
      destination_ids: [Airport.iata("NRT").id, Airport.iata("BKK").id }
  end }

  let(:bad_dest_deal) { Deal.create(
      headline: "Deal to Asia in June",
      description: "Blah blah blah",
      start_date: Date.new(2019,6,1),
      end_date: Date.new(2019,7,8),
      instructions: "Google it! It's everywhere!",
      origin_ids: [Airport.iata("DCA").id, Airport.iata("BWI").id, Airport.iata("IAD").id],  
      destination_ids: [Airport.iata("CGD").id, Airport.iata("FCO").id }
  end }

  let(:bad_date_deal) { Deal.create(
      headline: "Deal to Asia for Next June",
      description: "Blah blah blah",
      start_date: Date.new(2020,6,1),
      end_date: Date.new(2020,7,8),
      instructions: "Google it! It's everywhere!",
      origin_ids: [Airport.iata("DCA").id, Airport.iata("BWI").id, Airport.iata("IAD").id],  
      destination_ids: [Airport.iata("NRT").id, Airport.iata("BKK").id }
  end }

  let(:bad_origin_deal) { Deal.create(
      headline: "Deal to Asia in June",
      description: "Blah blah blah",
      start_date: Date.new(2019,6,1),
      end_date: Date.new(2019,7,8),
      instructions: "Google it! It's everywhere!",
      origin_ids: [Airport.iata("EWR").id, Airport.iata("JFK").id, Airport.iata("IAD").id],  
      destination_ids: [Airport.iata("NRT").id, Airport.iata("BKK").id }
  end }

  before :each do
    user.preferences.vacations.create(name:"All of June", start_date: Date.new(2019,6,1), end_date: Date.new(2019,6,30))
    user.preferences.home_airports = [:dca, :bwi]
    user.preferences.regions = [:asia]
  end

  describe "User" do
    it "can access its vacations" do
      expect(user.vacations.first.name).to eq "All of June"
    end
    
    it "can access its regions" do
      expect(user.regions.first.name).to eq "Asia"
    end

    it "can access its home airports" do
      expect(user.home_airports).to match [:dca, :bwi]
    end
  end

  describe "User#deals" do
    it "returns deals that match user's vacations, regions, and home airports" do
      expect(user.deals).to include good_asia_deal  
    end
  
    it "does not include deals for the wrong region" do
      expect(user.deals).to_not include :bad_dest_deal  
    end
  
    it "does not include deals for the wrong dates" do
      expect(user.deals).to_not include :bad_date_deal  
    end
  
    it "does not include deals for the wrong origin" do
      expect(user.deals).to_not include :bad_origin_deal  
    end

    it "returns a matching deal even if it's from only one of their home airports" do
      expect(user.deals).to include good_single_origin_deal 
    end
  end

end