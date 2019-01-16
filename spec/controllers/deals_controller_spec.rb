require 'rails_helper'

RSpec.describe DealsController, type: :controller do
  describe "create" do
    it "creates a deal with given params" do
      params = { 
        deal: {
          headline: "Great deals to NYC!",
          description: "Direct round-trips to New York for under $100!",
          start_date: ,
          end_date: ,
          instructions: "Google it! It's everywhere!",         
        }
      }
    end
  end
end
