describe("Deals class", () => {
  // it('constucts a deal', () => {
  //   let deal = new Deal()
  //   expect(deal).to.be.an.instanceof(Deal)
  // });

  it("contructs a Deal object from a json", () => {
    let json = {
      id: 6,
      headline: "IAD to Beijing for $535 non-stop round trip - United Airlines",
      description:
        'Departure dates available from February 20 to April 6 almost daily. Check out the calendar \u003ca href="http://mail01.tinyletterapp.com/FaresYouCanUse/today-s-flights-shanghai-beijing-moscow-lisbon/13513657-www.google.com/flights?c=cf040a38-8c96-4f9b-9338-8c223c053a53"\u003ehere\u003c/a\u003e.',
      start_date: "2019-02-20",
      end_date: "2019-04-06",
      links: [],
      region_name: "Asia",
      origins: [
        {
          id: 2656,
          name: "Washington Dulles International Airport",
          city: "Washington",
          country: "United States",
          iata: "IAD"
        }
      ],
      destinations: [
        {
          id: 2324,
          name: "Beijing Capital International Airport",
          city: "Beijing",
          country: "China",
          iata: "PEK"
        }
      ]
    };
    let deal = new Deal(json);
    expect(deal.id).to.equal(json['id'])
    expect(deal.headline).to.equal(json['headline'])
    expect(deal.description).to.equal(json['description'])
    expect(deal.start_date).to.equal(json['start_date'])
    expect(deal.end_date).to.equal(json['end_date'])
    expect(deal.region_name).to.equal(json['region_name'])
    // debugger
  });
});
