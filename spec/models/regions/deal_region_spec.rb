require 'rails_helper'

describe "Region as real relationship" do
  let(:cdg) { Airport.iata("CDG") }
  let(:mad) { Airport.iata("MAD") }
  let(:eur) { Region.find_by(name:"Europe") }
  let(:afr) { Region.find_by(name:"Africa") }

  describe "Airport#region" do
    after :each do
      Airport.last.delete unless Airport.last.name
    end
  
    context "airport already has a region" do
      it "returns the airport's region" do
        a = Airport.create(country: "France", region: Region.find_by(name:"Europe"))
        expect(a.region.name).to eq "Europe"
      end

      it "doesn't call set_region" do
        a = Airport.create(country: "France", region: Region.find_by(name:"Europe"))
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
  
  end
  
  describe "Airport#region=" do
    after :each do
      Airport.last.delete unless Airport.last.name
    end
  
    it "can set an airport's region manually" do
      a = Airport.create(country: "France")
      expect(a.region).to eq(eur)
      a.region = afr
      expect(a.region).to eq(afr)
    end
  end

  describe "Deal#destinations=" do
    context "creating a deal with a destination" do
      it "saves the deal with the region for that destination, and correctly sets the destinations" do
        d = Deal.create(destinations: [cdg, mad])
        expect(d.destinations).to eq([cdg, mad])
        expect(d.region).to eq(eur)
      end
    end
  
    context "assigning a destination via #destination_codes to an existing deal" do
      it "sets the deal's region to the desination's region, and correctly sets the destinations" do
        d = Deal.create
        d.destination_codes = "CDG, MAD"
        expect(d.destinations).to eq([cdg, mad])
        expect(d.region).to eq(eur)
      end
    end
  
    context "assigning a destination via array assignment to an existing deal" do
      it "sets the deal's region to the desination's region, and correctly sets the destinations" do
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
    
  describe "Deal#region" do
    context "deal already has a region assigned" do
      it "returns the region" do
        d = Deal.create(region: eur)
        expect(d.region).to eq(eur)
      end
  
    context "deal doesn't have a region yet" do
      it "sets the deal's region to its destination's region" do
        d = Deal.create(destinations:[cdg, mad])
        expect(d.region).to eq(eur)
      end
    end
  end

  describe "Deal#region=" do
    it "sets the region for a regionless deal" do
      d = Deal.create
      d.region = eur
      expect(d.region).to eq(eur)
    end

    it "manually overrides a deal that already has a region" do
      d = Deal.create(destinations: [cdg, mad])
      expect(d.region).to eq(eur)
      d.region = afr
      expect(d.region).to eq(afr)
    end
  end
end

end # TOTALLY UNCLEAR WHY THIS LAST AND IS REQUIRED!!!! (BUT IT IS!)