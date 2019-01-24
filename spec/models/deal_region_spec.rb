require 'rails_helper'

RSpec.describe 'Deal#region', type: :model do
  let(:cdg) { Airport.iata("CDG") }
  let(:mad) { Airport.iata("MAD") }

  context "creating a deal with a destination" do
    it "correctly sets the destinations and saves the deal with the region for that destination" do
      d = Deal.create(destinations: [cdg, mad])
      expect(d.destinations).to eq([cdg, mad])
      expect(d.region).to eq(cdg.region)
    end
  end

  context "assigning a destination via #destination_codes to an existing deal" do
    it "correctly sets the destinations and sets the deal's region to the desination's region" do
      d = Deal.create
      d.destination_codes = "CDG, MAD"
      expect(d.destinations).to eq([cdg, mad])
      expect(d.region).to eq(cdg.region)
    end
  end

  context "assigning a destination via array assignment to an existing deal" do
    it "correctly sets the destinations and sets the deal's region to the desination's region" do
      d = Deal.create
      d.destinations = [cdg, mad]
      expect(d.destinations).to eq([cdg, mad])
      expect(d.region).to eq(cdg.region)
    end
  end

  context "deal without destinations" do
    it "has no region assigned" do
      d = Deal.create
      expect(d.region).to eq(nil)
    end
  end

end
