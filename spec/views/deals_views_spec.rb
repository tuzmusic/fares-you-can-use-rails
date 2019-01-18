require 'rails_helper'

RSpec.describe "Deals Views", type: :feature do

  describe "show" do
      let(:deal) { Deal.create(
        headline: "Great deals to NYC!",
        description: "Direct round-trips from DC to New York for under $100! Good for the first week of February.",
        start_date: Date.new(2019,2,1),
        end_date: Date.new(2019,2,8),
        instructions: "Google it! It's everywhere!",
        origin_ids: [Airport.iata("DCA").id, Airport.iata("IAD").id, Airport.iata("BWI").id],  
        destination_ids: [Airport.iata("EWR").id, Airport.iata("LGA").id, Airport.iata("JFK").id]) }

    before :each do
      visit deal_path(deal)
    end

    it "shows a deal's title, description, and instructions" do
      expect(page).to have_content(deal.headline)
      expect(page).to have_content(deal.description)
      expect(page).to have_content(deal.instructions)
    end
    
    it "shows the start and end dates of a deal" do
      expect(page).to have_content "Feb. 1, 2019"
      expect(page).to have_content "Feb. 8, 2019"
    end

    xit "marks a deal as possibly expired if it's more than a week old" do
      
    end

    it "shows deal's origin airports" do
      expect(page).to have_content "From: DCA, IAD, BWI"
    end   
    
    it "shows deal's destination airports" do
      expect(page).to have_content "To: EWR, LGA, JFK"
    end  

    xit "has some 'back' navigation" do
      
    end
  end
  
  describe "new" do
    before :each do 
      visit new_deal_path 
    end

    it "has fields for the text-based properties of a deal" do
      expect(page).to have_field "deal[headline]"
      expect(page).to have_field "deal[description]"
      expect(page).to have_field "deal[instructions]"
      expect(page).to have_field "deal[origins]"
      expect(page).to have_field "deal[destinations]"
    end

    xit "has pickers for the date selectors" do
      expect(page).to have_select('deal[start_date]')
    end

    it "allows the user to enter comma-separated airport codes" do
      expect(false).to eq(true)
    end

    it "creates a deal" do
      expect(false).to eq(true)
    end

    it "redirects to the show page for the newly created deal" do
      expect(false).to eq(true)
    end
  end

  describe "index" do
    before :each do
      visit deals_path
    end

    it "lists all the deals, with their descriptions" do
      
    end
    it "links to each deal's show page" do
      
    end
    it "marks a deal as possibly expired if it's more than a week old" do
      
    end
  end


end
