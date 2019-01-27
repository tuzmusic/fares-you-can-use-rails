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

  describe "region#show (deal#index with region_id, or something)" do

    let(:eur) { Region.find_by name: "Europe" }
    let(:dca) { Airport.iata("DCA") }
    let(:cdg) { Airport.iata("CDG") }
    let(:ord) { Airport.iata("ORD") }
    let(:d1) {  d = Deal.create(headline: "A Deal for Europe in February")
                d.posted_date = Date.today
                d.description = "Some Info"
                d.origin = dca
                d.destination = cdg
                d.start_date = Date.new(2019,2,1)
                d.end_date = Date.new(2019,2,28)
              }
    let(:d2) {  d = Deal.create(headline: "A Deal for Europe in March")
                d.posted_date = Date.new(2018,1,1)
                d.description = "Some Info"
                d.origin = dca
                d.destination = cdg
                d.start_date = Date.new(2019,3,1)
                d.end_date = Date.new(2019,3,28)
              }
    let(:d3) {  d = Deal.create(headline:"A Deal for O'Hare in March")
                d.description = "Some Info"
                d.origin = dca
                d.destination = ord
                d.start_date = Date.new(2019,3,1)
                d.end_date = Date.new(2019,3,28)
              }


    before :each do
      [d1, d2, d3] # let variables must be touched to be created
      visit region_deals_path(eur)  # probably wrong
    end
    
    it "should actually be a deals index page" do
      expect(current_path).to eq '/regions/europe/deals'
    end

    it "has a heading for the region" do
      expect(page).to have_css 'h1', text:"Europe Deals" 
    end

    it "lists all the deals for that region" do
      expect(page).to have_content "A Deal for Europe in February"
      expect(page).to have_content "A Deal for Europe in March"
      binding.pry
      expect(page.all('#deal').count).to eq 2
    end

    it "shows the dates for the deals" do
      expect(page).to have_content "Feb. 1, 2019 to Feb. 28, 2019"
      expect(page).to have_content "Mar. 1, 2019 to Mar. 28, 2019"
    end
    
    it "sorts the deals from earliest to latest" do
      all_text = page.all.map(:text)
      expect(text.index("Europe in February")).to be < text.index("Europe in February")
    end

    xit "doesn't show deals for dates in the past" do
      d = Deal.create(headline:"A Deal for Europe Last Year")
      d.description = "Some Info"
      d.origin = dca
      d.destination = cdg
      d.start_date = Date.new(2018,3,1)
      d.end_date = Date.new(2018,3,28)
      expect(page).to_not have_content "A Deal for Europe Last Year"
    end
    
    it "has a link to each deal" do
      expect(page).to have_link href: region_deal_path(d1)
      expect(page).to have_link href: region_deal_path(d2)
    end

    it "doesn't show deals from other regions" do
      expect(page).to_not have_content "O'Hare"
    end

    it "marks deals as possibly expired" do
      expect(page).to have_content "POSSIBLY EXPIRED - A Deal for Europe in March"
    end
  end
end