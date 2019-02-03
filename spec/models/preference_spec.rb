require 'rails_helper'

describe Preference, type: :model do
  let(:user) { create_user }
  let(:pref) { Preference.create(user: user) } 

  xit "belongs to a user" do
    user.preference = pref
    expect(user.preference).to eq pref
    expect(pref.user).to eq user
  end

  it "has many vacations" do
    pref.vacations.create(name:"Summer", start_date:Date.new(2019,6,1), end_date:Date.new(2019,9,1))
    pref.vacations.create(name:"Christmas Break", start_date:Date.new(2019,12,18), end_date:Date.new(2020,1,4))
    pref.save
    expect(pref.vacations.pluck(:name)).to match ["Summer", "Christmas Break"]
  end

  it "has many regions" do
    pref.regions << Region.first
    pref.regions << Region.last
    pref.save
    expect(pref.regions.pluck(:name)).to match [Region.first.name, Region.last.name] 
  end

  it "has many home airports" do
    pref.home_airports << Airport.iata("DCA")
    pref.home_airports << Airport.iata("IAD")
    pref.save
    expect(pref.home_airports.pluck(:iata)).to match ["DCA", "IAD"] 
  end
end
