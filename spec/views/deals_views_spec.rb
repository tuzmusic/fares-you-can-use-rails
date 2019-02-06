require 'rails_helper'
require_relative '../spec_helpers/create_ny_and_dc_airports.rb'

describe "Deals Views", type: :feature do
  before :each do
    create_user_and_sign_in
  end
  
  describe "show" do
    let(:deal) { Deal.create(
        headline: "Great deals to NYC!",
        description: "Direct round-trips from DC to New York for under $100! Good for the first week of February.",
        start_date: Date.new(2019,2,1),
        end_date: Date.new(2019,2,8),
        origin_ids: [Airport.iata("DCA").id, Airport.iata("BWI").id, Airport.iata("IAD").id],  
        destination_ids: [Airport.iata("EWR").id, Airport.iata("JFK").id, Airport.iata("LGA").id]) }

    before :each do
      AirportSpecHelper.create_ny_and_dc_airports
      visit deal_path(deal)
    end

    it "shows a deal's title, and description" do
      expect(page).to have_content(deal.headline)
      expect(page).to have_content(deal.description)
    end
    
    it "shows the start and end dates of a deal" do
      expect(page).to have_content "Feb. 1, 2019"
      expect(page).to have_content "Feb. 8, 2019"
    end

    it "marks a deal as possibly expired if it's more than a week old" do
      deal.update(posted_date: Date.new(2018,2,1))
      page.refresh
      expect(page).to have_content "POSSIBLY EXPIRED"
    end

    it "shows deal's origin airports" do
      expect(page).to have_content "DCA (Ronald Reagan Washington National)"
      expect(page).to have_content "BWI (Baltimore/Washington International Thurgood Marshall)"
      expect(page).to have_content "IAD (Washington Dulles International)"
    end   
    
    it "shows deal's destination airports" do
      expect(page).to have_content "EWR (Newark Liberty International)"
      expect(page).to have_content "JFK (John F Kennedy International)"
      expect(page).to have_content "LGA (La Guardia)"
    end  

    xit "has some 'back' navigation" do
      
    end
  end
  
  describe "new" do
    before :each do 
      create_and_log_in_admin
      visit new_deal_path 
    end

    it "has fields for the text-based properties of a deal" do
      expect(page).to have_field "Headline"
      expect(page).to have_field "Description"
      expect(page).to have_field "Origin airports"
      expect(page).to have_field "Destination airports"
    end

    it "has fields to add links" do
      d = Deal.create(description: "Direct round-trips from DC to New York for under $100! Good for the first week of February.",
        start_date: Date.new(2019,2,1),
        end_date: Date.new(2019,2,8),
        origin_ids: [Airport.iata("DCA").id, Airport.iata("IAD").id, Airport.iata("BWI").id],  
        destination_ids: [Airport.iata("EWR").id, Airport.iata("LGA").id, Airport.iata("JFK").id])
      
      headline = "Great deals to NYC!" # can't create both deals with same headline or slug will break validation
      
      fill_in 'Headline', with: headline
      fill_in 'Description', with: d.description

      fill_in 'deal_links_attributes_0_text', with: "sample link text 1"
      fill_in 'deal_links_attributes_0_url', with: "www.google1.com"
      fill_in 'deal_links_attributes_1_text', with: "sample link text 2"
      fill_in 'deal_links_attributes_1_url', with: "www.google2.com"

      select '2019', from: 'deal_start_date_1i'
      select 'Feb', from: 'deal_start_date_2i'
      select '1', from: 'deal_start_date_3i'
      select '2019', from: 'deal_end_date_1i'
      select 'Feb', from: 'deal_end_date_2i'
      select '8', from: 'deal_end_date_3i'

      fill_in 'Origin airports', with: 'DCA, IAD, BWI'
      fill_in 'Destination airports', with: 'EWR, LGA, JFK'

      expect{ click_on 'Create Deal' }.to change{ Deal.count }.by(1)
      
      nd = Deal.last
      expect(nd.links.count).to eq 2
      expect(nd.links[0].text).to eq  "sample link text 1"
      expect(nd.links[0].url).to eq  "www.google1.com"
      expect(nd.links[1].text).to eq  "sample link text 2"
      expect(nd.links[1].url).to eq  "www.google2.com"
    end
    
    it "creates a deal and redirects to the show page for the newly created deal" do
      AirportSpecHelper.create_ny_and_dc_airports
      d = Deal.create(description: "Direct round-trips from DC to New York for under $100! Good for the first week of February.",
        start_date: Date.new(2019,2,1),
        end_date: Date.new(2019,2,8),
        origin_ids: [Airport.iata("DCA").id, Airport.iata("IAD").id, Airport.iata("BWI").id],  
        destination_ids: [Airport.iata("EWR").id, Airport.iata("LGA").id, Airport.iata("JFK").id])
      
      headline = "Great deals to NYC!" # can't create both deals with same headline or slug will break validation
      
      fill_in 'Headline', with: headline
      fill_in 'Description', with: d.description
      
      select '2019', from: 'deal_start_date_1i'
      select 'Feb', from: 'deal_start_date_2i'
      select '1', from: 'deal_start_date_3i'
      select '2019', from: 'deal_end_date_1i'
      select 'Feb', from: 'deal_end_date_2i'
      select '8', from: 'deal_end_date_3i'

      fill_in 'Origin airports', with: 'DCA, IAD, BWI'
      fill_in 'Destination airports', with: 'EWR, LGA, JFK'

      expect{ click_on 'Create Deal' }.to change{ Deal.count }.by(1)
      
      nd = Deal.last
      expect(nd.headline).to eq headline
      expect(nd.description).to eq d.description
      expect(nd.start_date).to eq d.start_date
      expect(nd.end_date).to eq d.end_date
      expect(nd.origins.pluck(:name).sort).to match d.origins.pluck(:name).sort
      expect(nd.destinations.pluck(:name).sort).to match d.destinations.pluck(:name).sort
      
      expect(current_path).to eq deal_path(nd)
    end


  end

  describe "index" do
    before :each do
      Deal.create(posted_date: Date.new(2019,1,2), headline:"Deal for January")
      Deal.create(posted_date: Date.new(2019,1,2), headline:"Another deal for January")
      Deal.create(posted_date: Date.new(2019,2,4), headline:"Deal for February")
      Deal.create(posted_date: Date.new(2019,2,4), headline:"Another deal for February")
      Deal.create(posted_date: Date.new(2018,12,25), headline:"Deal for last Christmas")
      Deal.create(posted_date: Date.new(2018,12,25), headline:"Another deal for last Christmas")
      visit deals_path
    end
    
    it "lists all the deals, with their headlines" do
      expect(page).to have_content("Deal for January")
      expect(page).to have_content("Another deal for January")
      expect(page).to have_content("Deal for February")
      expect(page).to have_content("Another deal for February")
      expect(page).to have_content("Deal for last Christmas")
      expect(page).to have_content("Another deal for last Christmas")
    end

    it "links to each deal's show page" do
      click_link "Another deal for last Christmas"
      expect(current_path).to eq("/deals/#{Deal.last.slug}")
    end
    
    it "marks a deal as possibly expired if it's more than a week old" do
      expect(page).to have_content("POSSIBLY EXPIRED! - Another deal for last Christmas")
    end
    
    it "sorts deals by date" do
      expect(page).to have_content('Jan. 2, 2019')
      expect(page.all("div#deals-2019-01-02 p").count).to eq(2)      
      expect(page).to have_content('Feb. 4, 2019')      
      expect(page.all("div#deals-2019-02-04 p").count).to eq(2)      
      expect(page).to have_content('Dec. 25, 2018')      
      expect(page.all("div#deals-2018-12-25 p").count).to eq(2)      
    end
  end

  describe "edit" do
    let(:d) {
      Deal.create(headline: "Great deals to NYC!",
      description: "Direct round-trips from DC to New York for under $100! Good for the first week of February.",
      start_date: Date.new(2019,2,1),
      end_date: Date.new(2019,2,8)).tap do |d|
        d.origin_codes = "DCA, BWI, IAD"
        d.destination_codes = "EWR, JFK, LGA"
      end
    }
    before :each do
      AirportSpecHelper.create_ny_and_dc_airports
      create_and_log_in_admin
      visit edit_deal_path(d)
    end
    
    it "has the edit form" do
      expect(page).to have_field "deal[headline]"
      expect(page).to have_field "deal[description]"
      expect(page).to have_field "deal[origins]"
      expect(page).to have_field "deal[destinations]"
    end

    it "populates the headline and description fields" do
      expect(page).to have_field("Headline", with: d.headline)
      expect(page).to have_content(d.description)
    end
    
    it "lists the correct origin & destination airports" do
      expect(page).to have_field("Origin", with: d.origin_codes)
      expect(page).to have_field("Destination", with: d.destination_codes)
    end

    it "edits the deal" do
      fill_in "Headline", with: "New Headline"
      fill_in "Description", with: "New Description"
      fill_in "Origin airports", with: "LGA"
      fill_in "Destination airports", with: "JFK"

      select '2020', from: 'deal_start_date_1i'
      select 'Jul', from: 'deal_start_date_2i'
      select '1', from: 'deal_start_date_3i'
      select '2021', from: 'deal_end_date_1i'
      select 'Aug', from: 'deal_end_date_2i'
      select '3', from: 'deal_end_date_3i'
      
      click_on "Update Deal"
      
      d.reload
      
      expect(d.headline).to eq "New Headline"
      expect(d.description).to eq "New Description"
      expect(d.origin_codes).to eq "LGA"
      expect(d.destination_codes).to eq "JFK"
      expect(d.start_date).to eq(Date.new(2020,7,1))
      expect(d.end_date).to eq(Date.new(2021,8,3))
    end
  end

end
