require 'rails_helper'

RSpec.describe 'Deals', type: :model do
  it "can have multiple origin airports" do
    deal = Deal.create(headline:"Deal from DC")
    deal.origins << Airport.iata("DCA")
    deal.origins << Airport.iata("IAD")
    deal.origins << Airport.iata("BWI")

    expect(deal.origins.count).to eq(3)
    expect(deal.origins.pluck :iata).to match(["DCA", "IAD", "BWI"])
    expect(deal.origins.first).to be_an_instance_of(Airport)
  end
end
