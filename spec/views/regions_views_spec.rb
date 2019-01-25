require 'rails_helper'

RSpec.describe "Regions views" do
  describe "index" do
    before :each do
      visit regions_path 
    end 

    it "shows all the regions" do
      expect(page.all('.region').count).to eq Region.count
      expect(page).to have_content("Europe")
    end

    it "shows the number of deals for each region" do
      d = Deal.create
      d.destination_codes = "CDG"
      page.refresh

      expect(page).to have_content('Europe (1 deal)')
      expect(page).to have_content('(0 deals)', count: Region.count-1)
    end

    it "links to each region's show page, using a SLUG" do
      click_link 'Africa'
      expect(current_path).to eq('/regions/africa')
    end
  end

  describe "show (deal#index with region_id, or something)" do

    let(:eur) { Region.find_by name: "Europe" }
    let(:dca) { Airport.iata("DCA") }
    let(:cdg) { Airport.iata("CDG") }
    let(:d1) {  Deal.create.tap do |d|
                d.headline = "A Deal for Europe in February"
                d.description = "Some Info"
                d.origins = [dca]
                d.destinations = [cdg]
                end
              }

    before :each do
      visit region_path(eur)  # probably wrong
    end
    
    it "lists all the deals for that region" do

      expect(true).to eq(false)
    end

    it "shows the dates for the deal" do
      exit
    end
    
    it "sorts the deals by date" do
      exit
    end

    it "has a link to each deak" do
      exit
    end

    it "doesn't show deals from other regions" do
      exit
    end

    it "marks deals as possibly expired" do
      exit
    end
  end
end