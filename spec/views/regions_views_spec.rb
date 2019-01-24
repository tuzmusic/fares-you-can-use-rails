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
      expect(current_path).to eq('regions/africa')
    end
  end
end