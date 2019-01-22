class AirportSpecHelper
  def self.create_ny_and_dc_airports
    Airport.create(name: "Ronald Reagan Washington National Airport",
      city: "Washington",
      country: "United States",
      iata: "DCA",
      icao: "KDCA",
      latitude: 38.8521,
      longitude: -77.037697,
      altitude: 15.0,
      timezone: -5,
      dst: "A",)

    Airport.create(name: "Baltimore/Washington International Thurgood Marshall Airport",
      city: "Baltimore",
      country: "United States",
      iata: "BWI",
      icao: "KBWI",
      latitude: 39.17539978,
      longitude: -76.66829681,
      altitude: 146.0,
      timezone: -5,
      dst: "A",)

    Airport.create(name: "Washington Dulles International Airport",
      city: "Washington",
      country: "United States",
      iata: "IAD",
      icao: "KIAD",
      latitude: 38.94449997,
      longitude: -77.45580292,
      altitude: 312.0,
      timezone: -5,
      dst: "A",)

    Airport.create(name: "Newark Liberty International Airport",
      city: "Newark",
      country: "United States",
      iata: "EWR",
      icao: "KEWR",
      latitude: 40.6925010681152,
      longitude: -74.168701171875,
      altitude: 18.0,
      timezone: -5,
      dst: "A",)

    Airport.create(name: "John F Kennedy International Airport",
      city: "New York",
      country: "United States",
      iata: "JFK",
      icao: "KJFK",
      latitude: 40.63980103,
      longitude: -73.77890015,
      altitude: 13.0,
      timezone: -5,
      dst: "A",)

    Airport.create(name: "La Guardia Airport",
      city: "New York",
      country: "United States",
      iata: "LGA",
      icao: "KLGA",
      latitude: 40.77719879,
      longitude: -73.87259674,
      altitude: 21.0,
      timezone: -5,
      dst: "A",)
 end 
end