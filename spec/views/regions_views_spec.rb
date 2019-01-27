require 'rails_helper'

describe "Regions views" do
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
                d.save; d
              }
    let(:d2) {  d = Deal.create(headline: "A Deal for Europe in March")
                d.posted_date = Date.new(2018,1,1)
                d.description = "Some Info"
                d.origin = dca
                d.destination = cdg
                d.start_date = Date.new(2019,3,1)
                d.end_date = Date.new(2019,3,28)
                d.save; d
              }
    let(:d3) {  d = Deal.create(headline:"A Deal for O'Hare in March")
                d.description = "Some Info"
                d.origin = dca
                d.destination = ord
                d.start_date = Date.new(2019,3,1)
                d.end_date = Date.new(2019,3,28)
                d.save; d
              }    
    let(:d4) {  d = Deal.create(headline:"Another Deal for O'Hare in March")
                d.description = "Some Info"
                d.origin = dca
                d.destination = ord
                d.start_date = Date.new(2019,3,1)
                d.end_date = Date.new(2019,3,28)
                d.save; d
              }    

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
      d.destination = cdg
      page.refresh

      expect(page).to have_content('Europe (1 deal)')
      expect(page).to have_content('(0 deals)', count: Region.count-1)
    end

    it "links to each region's deal index page, using a SLUG" do
      click_link 'Africa'
      expect(current_path).to eq('/regions/africa/deals')
    end

    it "sorts regions from most to least deals" do
      [d1,d3,d4] # create 2 ORD deals and 1 CDG deal
      page.refresh
      expect(page.text.index("Midwestern USA")).to be < page.text.index("Europe")
    end
  end

  describe "region#show (deal#index with region_id, or something)" do

    before :each do
      [d1, d2, d3] # let variables must be touched to be created
      visit region_deals_path(eur)  # probably wrong
    end
    
    it "should actually be a deals index page" do
      expect(current_path).to eq '/regions/europe/deals'
    end

    it "should redirect to the region_deals page from the region_path" do
      visit region_path Region.first
      expect(current_path).to eq region_deals_path(Region.first)
    end

    it "has a heading for the region" do
      expect(page).to have_css 'h1', text:"Europe Deals" 
    end

    it "lists all the deals for that region" do
      expect(page).to have_content "A Deal for Europe in February"
      expect(page).to have_content "A Deal for Europe in March"
      expect(page.all('.deal').count).to eq 2
    end

    it "shows the dates for the deals" do
      expect(page).to have_content "Feb. 1, 2019 to Feb. 28, 2019"
      expect(page).to have_content "Mar. 1, 2019 to Mar. 28, 2019"
    end
    
    it "sorts the deals from earliest to latest" do
      expect(page.body.index("Europe in February")).to be < page.body.index("Europe in March")
    end

    it "doesn't show deals for dates in the past" do
      d = Deal.create(headline:"A Deal for Europe Just Passed")
      d.description = "Some Info"
      d.origin = dca
      d.destination = cdg
      d.start_date = Date.new(2018,3,1)
      d.end_date = Date.yesterday
      d.save
      page.refresh
      expect(page).to_not have_content "A Deal for Europe Last Year"
    end
    
    it "has a link to each deal" do
      expect(page).to have_link d1.headline, href: region_deal_path(eur, d1)
      expect(page).to have_link d2.headline, href: region_deal_path(eur, d2)
    end

    it "doesn't show deals from other regions" do
      expect(page).to_not have_content "O'Hare"
    end

    it "marks deals as possibly expired" do
      expect(page).to have_content "POSSIBLY EXPIRED! - A Deal for Europe in March"
    end
  end
end