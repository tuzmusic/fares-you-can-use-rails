require 'rails-helper'

RSpec.describe "Regions views" do
  describe "index" do
    it "shows all the regions" do
      expect(page.css('div#region').count).to eq Region.count
    end

    it "shows the number of deals for each region" do
      expect(page).to have_content('Europe (1 deal)')
      expect(page).to have_content('Midwestern USA (0 deals)')
    end

    it "links to each region's show page" do
      click_link 'Africa'
      expect(current_path).to eq('regions/africa')
    end
  end
end