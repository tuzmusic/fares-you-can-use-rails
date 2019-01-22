require 'rails_helper'

RSpec.describe 'Region', type: :model do
  it "includes all continents outside north america" do
    expect(Region.find_by(name:"Africa")).to exist
    expect(Region.find_by(name:"Australia")).to exist
    expect(Region.find_by(name:"Europe")).to exist
    expect(Region.find_by(name:"South America")).to exist
    expect(Region.find_by(name:"Asia")).to exist
  end

  it "includes mexico and canada as their own regions" do
    expect(Region.find_by(name:"Mexico")).to exist
    expect(Region.find_by(name:"Canada")).to exist
  end
end


