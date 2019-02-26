describe Api::DealsController, type: :controller do

  let(:dca_to_ny) { dummy_deal } 
  let(:cdg_to_cai) { dummy_deal.tap do |d|
    d.origin = Airport(iata: "CDG")
    d.destination = Airport(iata:"CAI")
    d.start_date = Date.new(2018,6,1),
    d.end_date = Date.new(2018,7,8),
  end }

  before :each do
    create_user_and_sign_in
    # log_in_user_from_controller
  end

  describe "/api/deals/" do
    it "gets ALL deals" do
    end
  end

  describe "api/deals/from/:iata" do
    it "gets deals from a given airport iata code" do
    end
  end

  describe "api/deals/to/:iata" do
    it "gets deals to a given airport iata code" do
    end
  end

  describe "api/deals/to/:region_slug" do
    it "gets deals to a given region" do
    end
  end

  describe "api/deals/dates/:start_date/:end_date" do
    it "gets deals during a certain date range" do
    end
  end

end