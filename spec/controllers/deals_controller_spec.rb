require 'rails_helper'

RSpec.describe DealsController, type: :controller do
  describe "create" do
    it "creates a deal with given params" do
      params = { 
        deal: {
          headline: "Great deals to NYC!",
          description: "Direct round-trips from DCA to New York for under $100!",
          start_date: ,
          end_date: ,
          instructions: "Google it! It's everywhere!",      
          # how do I pass in Origins and Destinations? check other projects with join tables for their form's params.   
        }
      }
    end
  end
end
