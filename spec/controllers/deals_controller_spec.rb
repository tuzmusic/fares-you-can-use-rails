require 'rails_helper'


RSpec.describe DealsController, type: :controller do
  describe "create" do

    let(:params) {
       { deal: {
          headline: "Great deals to NYC!",
          description: "Direct round-trips from DC to New York for under $100! Good for the first week of February.",
          start_date: Date.new(2019,2,1),
          end_date: Date.new(2019,2,8),
          instructions: "Google it! It's everywhere!",
          origin_ids: [Airport.iata("DCA").id, Airport.iata("IAD").id, Airport.iata("BWI").id],  
          destination_ids: [Airport.iata("EWR").id, Airport.iata("LGA").id, Airport.iata("JFK").id]  
        }   
      }
    }


    before(:each) do
      get :create, params: params
    end

    it "creates a deal with given params" do
      # expect(Deal.count).to change.by(1)
      
      d = Deal.last
      expect(d).to be_an_instance_of(Deal)
      expect(d.headline).to eq "Great deals to NYC!"
      expect(d.description).to eq "Direct round-trips from DC to New York for under $100! Good for the first week of February."
      expect(d.start_date).to eq Date.new(2019,2,1)
      expect(d.end_date).to eq Date.new(2019,2,8)
      expect(d.instructions).to eq "Google it! It's everywhere!"
      expect(d.origins.pluck(:iata)).to match(["DCA","IAD","BWI"])
      expect(d.destinations.pluck(:iata)).to match(["EWR","LGA","JFK"])
    end
  end
end
