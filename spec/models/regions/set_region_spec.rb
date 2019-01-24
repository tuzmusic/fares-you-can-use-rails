require 'rails_helper'

describe "Airport#set_region" do    
  it "returns the continent for an airport outside of North America" do
    aus = Airport.find_by(country:"Australia")
    expect(aus.region.name).to eq("Australia")

    afr = Airport.find_by(country:"South Africa")
    expect(afr.region.name).to eq("Africa")

    eur = Airport.find_by(country:"Germany")
    expect(eur.region.name).to eq("Europe")

    asia = Airport.find_by(country:"Thailand")
    expect(asia.region.name).to eq("Asia")

    southam = Airport.find_by(country:"Brazil")
    expect(southam.region.name).to eq("South America")
  end
  
  it "returns the region of the US for airports in the US" do
    expect(Airport.iata("EWR").region.name).to eq "Northeastern USA"
    expect(Airport.iata("MIA").region.name).to eq "Southeastern USA"
    expect(Airport.iata("ORD").region.name).to eq "Midwestern USA"
    expect(Airport.iata("DFW").region.name).to eq "Southern USA"
    expect(Airport.iata("SEA").region.name).to eq "Northwestern USA"
    expect(Airport.iata("SAF").region.name).to eq "Southwestern USA"
  end

  it "creates and assigns a region for the country if it can't find another region" do
    expect(Airport.iata("LSV").region.name).to eq("United States") # Military US airport, no state assigned
    expect(Airport.iata("FAJ").region.name).to eq("Puerto Rico") # Puerto Rico
    expect(Airport.find_by(country:"Mexico").region.name).to eq("Mexico")
    expect(Airport.find_by(country:"Canada").region.name).to eq("Canada")
    expect(Airport.find_by(city:"Moscow").region.name).to eq("Russia")
  end
end

describe "Deal#region" do
  it "returns the region based on the first destination airport" do
    d = Deal.create(headline:"Deal to Japan")
    d.destination_codes = "NRT"

    expect(d.region.name).to eq("Asia")
  end
end


