require 'rails_helper'

RSpec.describe 'Airport#region', type: :model do
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

  it "returns the country for canada and mexico" do
    can = Airport.find_by(country:"Canada")
    expect(can.region.name).to eq("Canada")

    mex = Airport.find_by(country:"Mexico")
    expect(mex.region.name).to eq("Mexico")
  end

  it "returns the region of the US for airports in the US" do
    expect(Airport.iata("EWR").region.name).to eq "Northeastern USA"
    expect(Airport.iata("MIA").region.name).to eq "Southeastern USA"
    expect(Airport.iata("ORD").region.name).to eq "Midwestern USA"
    expect(Airport.iata("DFW").region.name).to eq "Southern USA"
    expect(Airport.iata("SEA").region.name).to eq "Northwestern USA"
    expect(Airport.iata("SAF").region.name).to eq "Southwestern USA"
  end
end


