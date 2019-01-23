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
end


