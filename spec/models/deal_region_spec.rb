require 'rails_helper'

RSpec.describe "Setting a Deal's region with Deal#destinations=", type: :model do
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

RSpec.describe "Setting an airport's region" do

  after :each do
    Airport.where(name:nil).destroy
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

  context "setting a state for an existing airport" do
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