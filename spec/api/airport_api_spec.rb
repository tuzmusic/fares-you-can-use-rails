describe Api::AirportsController, type: :controller do
  describe "show" do
    it "returns a JSON:API-compliant, serialized object representing the specified Airport" do
      correct_hash = {
        "id" => "2555",  # this is the ID in the test environment, though diff. in dev. env.
        "type" => "airports",
        "attributes" => {
          "name" => "Ronald Reagan Washington National Airport",
          "city" => "Washington",
          "country" => "United States",
          "iata" => "DCA" 
        },
        "jsonapi" => {
          "version" => "1.0"
        }
      }

      get :show, params: {slug: 'dca'}
      returned_json = response.body
      parsed_json = JSON.parse(returned_json)['data']
      expect(parsed_json).to eq correct_hash
    end
  end
end
