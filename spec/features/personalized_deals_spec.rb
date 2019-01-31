require 'rails_helper'

describe "Personalized Deals" do
  let(:dca) { Airport.iata("DCA") }  
  let(:lax) { Airport.iata("LAX") }  
  let(:deal) { Deal.create(headline:"Sample Deal", origins:[dca], destinations: [lax])}
  let (:v) { Vacation.create(name:"Christmas Break", start_date:Date.new(2019,12,18), end_date:Date.new(2020,1,4)) }

  describe "Vacation#deals" do
    
    it "returns the deals that fall within the dates of the vacation" do
      deal.update(start_date: Date.new(2019,12,25), end_date:(Date.new 2019,12,30))
      expect(v.deals).to include deal
    end

    it "returns deals that start before the vacation and end during the vacation" do
      deal.update(start_date: Date.new(2019,11,25), end_date:(Date.new 2019,12,30))
      expect(v.deals).to include deal
    end
    
    it "returns deals that start during the vacation and end after the vacation" do
      deal.update(start_date: Date.new(2019,12,25), end_date:(Date.new 2020,1,30))
      expect(v.deals).to include deal
    end
    
    it "returns deals that start on the start date of the vacation and end during the vacation" do
      deal.update(start_date: Date.new(2019,12,18), end_date:(Date.new 2019,12,30))
      expect(v.deals).to include deal
    end
    
    it "returns deals that start during the vacation and end on the end date the vacation" do
      deal.update(start_date: Date.new(2019,12,25), end_date:(Date.new 2020,1,4))
      expect(v.deals).to include deal
    end
    
    it "returns deals that start before the vacation and end after the vacation" do
      deal.update(start_date: Date.new(2019,11,25), end_date:(Date.new 2020,1,30))
      expect(v.deals).to include deal
    end

    it "doesn't return deals completely outside the vacation dates" do
      deal.update(start_date: Date.new(2018,12,25), end_date:(Date.new 2018,12,30))
      expect(v.deals).to_not include deal
    end
  end

  # describe "User#deals" do
  #   it "returns the deals for the user's vacations that also match the user's favorite regions" do
  #     expect(false).to eq true 
  #   end    
  # end

end