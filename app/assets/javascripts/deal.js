class Deal {
  constructor({
    id,
    headline,
    description,
    start_date,
    end_date,
    posted_date,
    region_name,
    links,
    slug,
    origins,
    destinations
  }) {
    this.id = Number(id);
    this.headline = headline;
    this.description = description;
    this.start_date = new Date(start_date);
    this.end_date = new Date(end_date);
    this.posted_date = new Date(posted_date);
    this.region_name = region_name;
    this.links = links;
    this.slug = slug;
    this.origins = origins;
    this.destinations = destinations;
  }

  showPageParagraph() {
    return [
      this.showPageInfo(),
      this.showPageLinks(),
      this.showPageStats()
    ].join("");
  }

  showPageInfo() {
    return [
      `<h3>${this.headline}</h3>`,
      `<p>${this.postedDateHTML()}</p>`,
      `<p>${this.description}</p>`
    ].join("");
  }

  showPageLinks() {
    let body;
    if (this.links.length > 0) {
      body = this.links
        .map(link => `<a href="${link.url}" target="_blank">${link.text}</a>`)
        .join("<br>")
    } else {
      body = "Hmm... this deal has no links."
    }
    return ( `<p>${body}</p>`
    );
  }

  showPageStats() {
    let newDateRange = this.dateRangeHTML()
      .replace("Fly from", "")
      .replace("to", "-");
    return (
      `<p><b>Fly From:</b><br>${this.airportCodes(this.origins)}</p>` +
      `<p><b>Fly To:</b><br>${this.airportCodes(this.destinations)}</p>` +
      `<p><b>Fly Dates:</b><br>${newDateRange}</p>`
    );
  }

  airportCodes(airports) {
    // CONVERT TO USE AIRPORT OBJECT/CLASS
    // (although JS does accept dot notation for generic objects so /this/ code shouldn't have to change?)
    return airports.map(a => `${a.name} (${a.iata})`).join("<br>");
  }

  headlineLink() {
    return `<a href="/deals/${this.slug}">${this.headline}</a>`;
  }

  dateRangeHTML() {
    return `Fly from ${this.start_date.toDateString()} to ${this.end_date.toDateString()}`;
  }

  postedDateHTML() {
    return `<i>Posted on ${this.posted_date.toDateString()}</i>`;
  }

  indexParagraph() {
    return [
      `<p class="deal">${this.headlineLink()}`,
      `${this.dateRangeHTML()}`,
      `${this.postedDateHTML()}</p>`
    ].join("<br>");
  }
}