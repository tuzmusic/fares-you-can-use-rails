require 'rails_helper'
require_relative '../spec_helpers/create_ny_and_dc_airports.rb'

RSpec.describe DealsController, type: :controller do

  def create_deal
    post :create, params: creation_params
  end

  let(:creation_params) {
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

  let(:editing_params) {
     { deal: {
        headline: "EDITED Great deals to NYC!",
        description: "EDITED Direct round-trips from DC to New York for under $100! Good for the first week of March. VA to NY only (no NJ or MD airports included)",
        start_date: Date.new(2019,3,1),
        end_date: Date.new(2019,3,8),
        instructions: "EDITED Google it! It's everywhere!",
        origin_ids: [Airport.iata("DCA").id, Airport.iata("IAD").id],  
        destination_ids: [Airport.iata("LGA").id, Airport.iata("JFK").id]  
      }   
    }
  }

  describe "create" do

    it "creates a deal with given params" do
      # AirportSpecHelper.create_ny_and_dc_airports

      expect{ create_deal }.to change{ Deal.count }.by(1)
      
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

  describe "edit" do
    it "edits a deal with given params" do
      create_deal
      original_id = Deal.last.id

      patch :update, params: { use_route: 'deals/edit/', id: original_id, deal: editing_params[:deal] }

      d = Deal.last
      expect(d.id).to eq original_id
      expect(d.headline).to eq editing_params[:deal][:headline]
      expect(d.description).to eq editing_params[:deal][:description]
      expect(d.start_date).to eq editing_params[:deal][:start_date]
      expect(d.end_date).to eq editing_params[:deal][:end_date]
      expect(d.instructions).to eq editing_params[:deal][:instructions]
      expect(d.origins.pluck(:iata)).to match(["DCA","IAD"])
      expect(d.destinations.pluck(:iata)).to match(["LGA","JFK"])
    end
  end

  describe "destroy" do
    it "destroys a deal with a given id" do
      create_deal
      original_id = Deal.last.id

      delete :destroy, params: {id: original_id}

      expect(Deal.where(id: original_id)).not_to exist
    end
  end  
end
