require 'rails_helper'

RSpec.describe "Setting a Deal's region with Deal#destinations=", type: :model do
  let(:cdg) { Airport.iata("CDG") }
  let(:mad) { Airport.iata("MAD") }
  let(:eur) { Region.find_by(name:"Europe") }

  context "creating a deal with a destination" do
    it "correctly sets the destinations and saves the deal with the region for that destination" do
      d = Deal.create(destinations: [cdg, mad])
      expect(d.destinations).to eq([cdg, mad])
      expect(d.region).to eq(eur)
    end
  end

  context "assigning a destination via #destination_codes to an existing deal" do
    it "correctly sets the destinations and sets the deal's region to the desination's region" do
      d = Deal.create
      d.destination_codes = "CDG, MAD"
      expect(d.destinations).to eq([cdg, mad])
      expect(d.region).to eq(eur)
    end
  end

  context "assigning a destination via array assignment to an existing deal" do
    it "correctly sets the destinations and sets the deal's region to the desination's region" do
      d = Deal.create
      d.destinations = [cdg, mad]
      expect(d.destinations).to eq([cdg, mad])
      expect(d.region).to eq(eur)
    end
  end

  context "deal without destinations" do
    it "has no region assigned" do
      d = Deal.create
      expect(d.region).to eq(nil)
    end
  end
end

RSpec.describe "Airport@region - fetches and assigns the airport" do

  after :each do
    Airport.last.delete unless Airport.last.name
  end

  context "airport already has a region" do
      it "doesn't call set_region " do
        a = Airport.create(country: "Brazil", region: Region.first)
        expect(a).to_not receive(:set_region)
        a.region
      end
  end

  context "creating an airport" do
    context "outside the US" do
      it "sets the region based on the country" do
        a = Airport.create(country: "France")
        expect(a.region.name).to eq("Europe")
      end
    end

    context "inside the US" do
      it "sets the region based on the state" do
        a = Airport.create(country: "United States", state: State.find_by(name:"Maine"))
        expect(a.region.name).to eq("Northeastern USA")
      end
    end
  end

  context "setting a state for an existing airport with no region" do
    it "assigns that state's region to the airport's region" do
      a = Airport.create(country: "United States")
      a.update(state: State.find_by(name:"Maine"))
      expect(a.region.name).to eq("Northeastern USA")
    end
  end

  context "setting an airport's region manually" do
    it "can be done" do
      a = Airport.create(country: "France")
      expect(a.region.name).to eq("Europe")
      a.region = Region.find_by(name:"Africa")
      expect(a.region.name).to eq("Africa")
    end
  end
end

RSpec.describe "GETTING a deal's region with Deal#region" do
  context "deal already has a region assigned" do
    it "returns the region" do
      d = Deal.create(region: Region.first)
      expect(d.region).to eq(Region.first)
    end

    xit "doesn't assign anything or make any transaction" do
      # how to test this?
    end
  end

  let(:cdg) { Airport.iata("CDG") }
  let(:mad) { Airport.iata("MAD") }

  context "deal doesn't have a region yet" do
    it "sets the deal's region to its destination's region" do
      d = Deal.create(destinations:[cdg, mad])
      expect(d.region).to eq(eur)
    end
  end
end