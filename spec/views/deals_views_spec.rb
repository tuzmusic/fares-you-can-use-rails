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

    # it "allows the user to enter comma-separated airport codes" do
    # end

    it "creates a deal" do
      d = Deal.new(headline: "Great deals to NYC!",
        description: "Direct round-trips from DC to New York for under $100! Good for the first week of February.",
        start_date: Date.new(2019,2,1),
        end_date: Date.new(2019,2,8),
        instructions: "Google it! It's everywhere!",
        origin_ids: [Airport.iata("DCA").id, Airport.iata("IAD").id, Airport.iata("BWI").id],  
        destination_ids: [Airport.iata("EWR").id, Airport.iata("LGA").id, Airport.iata("JFK").id])

      fill_in 'Headline', with: d.headline
      fill_in 'Description', with: d.description
      fill_in 'Instructions', with: d.instructions
      
      select d.start_date.year, from: 'deal_start_date_1i'
      select 'Feb', from: 'deal_start_date_2i'
      select d.start_date.day, from: 'deal_start_date_3i'
      select d.end_date.year, from: 'deal_end_date_1i'
      select 'Feb', from: 'deal_end_date_2i'
      select d.end_date.day, from: 'deal_end_date_3i'

      fill_in 'Origin airports', with: 'DCA, IAD, BWI'
      fill_in 'Destination airports', with: 'EWR, LGA, JFK'

      expect{ click_on 'Create Deal' }.to change{ Deal.count }.by(1)
      
      nd = Deal.last

      expect(nd.headline).to eq d.headline
      expect(nd.description).to eq d.description
      expect(nd.start_date).to eq d.start_date
      expect(nd.end_date).to eq d.end_date
      expect(nd.instructions).to eq d.instructions
      expect(nd.origins).to match d.origins
      expect(nd.destinations).to match d.destinations
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
