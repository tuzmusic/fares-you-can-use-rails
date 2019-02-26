describe Api::AirportsController, type: :controller do
  describe "show" do
    it "returns a JSON:API-compliant, serialized object representing the specified Airport" do
      correct_hash = {
        "id" => "2555",
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

      get :show, id: 2555
      returned_json = response.body
      parsed_json = JSON.parse(returned_json)
      expect(parsed_json).to eq correct_hash
    end
  end
end
