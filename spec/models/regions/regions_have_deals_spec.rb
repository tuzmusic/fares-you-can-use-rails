require 'rails_helper'

describe "Region" do
  it "has many deals" do
    r = Region.first
    1.upto(3) {|i| Deal.create(headline:"Deal ##{i}", region: r) }
    expect(r.deals.count).to eq(3)
    expect(r.deals.last.headline).to eq("Deal #3")
  end
end