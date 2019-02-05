require 'rails_helper'

describe "Deal scope methods" do

  describe ".from_airport" do
    it "returns deals from the given airport" do
      from_dca = dummy_deal
      from_nrt = dummy_deal_from Airport.iata("NRT")
      expect(from_nrt.origins.first.iata).to eq "NRT" 
      dca = Airport.iata("DCA")
      expect(Deal.from_airport dca).to include from_dca
      expect(Deal.from_airport dca).to_not include from_nrt
    end
  end
end