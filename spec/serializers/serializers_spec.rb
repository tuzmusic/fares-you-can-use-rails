describe "AirportSerializer" do
  it "serializes an airport" do
    airport_hash = {
      id: 2555,
      name: "Ronald Reagan Washington National Airport",
      city: "Washington",
      country: "United States",
      iata: "DCA",
    }
    binding.pry
    expect(Airport.iata("DCA").to_json).to eq airport_hash
  end
end

# describe "DealsSerializer" do
#   it "serializes a deal" do
#     deal_hash = {
#       headline: "headline string",
#       description: "description string",

#     }
#   end
# end
