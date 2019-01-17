require 'rails_helper'


RSpec.describe DealsController, type: :controller do
  describe "create" do
    it "creates a deal with given params" do
      params = { 
        deal: {
          headline: "Great deals to NYC!",
          description: "Direct round-trips from DC to New York for under $100! Good for the first week of February.",
          start_date: Date.new(2019,2,1),
          end_date: Date.new(2019,2,8),
          instructions: "Google it! It's everywhere!"
        }   
      }
      binding.pry
      params[:origin_ids] = [Airport.iata("DCA").id, Airport.iata("IAD").id, Airport.iata("BWI").id],  
      params[:destination_ids] [Airport.iata("EWR").id, Airport.iata("LGA").id, Airport.iata("JFK").id]  
      binding.pry
    end
  end
end
