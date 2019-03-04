class Deal {
  constructor({
    id,
    headline,
    description,
    start_date,
    end_date,
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
    this.region_name = region_name;
    this.links = links;
    this.slug = slug;
    this.origins = origins;
    this.destinations = destinations;
  }

  headlineLink() {
    return `<a href="/deals/${this.slug}">${this.headline}</a>`;
  }

  dateRangeHTML() {
    return `Fly from ${this.start_date.toDateString()} to ${this.end_date.toDateString()}`;
  }

  indexParagraph() {
    return `<p class="deal">${this.headlineLink()}<br>${this.dateRangeHTML()}</p>`
  }
}
Date.fromRailsStr = function(str) {
  let date = new Date(str);
  let day = date.getDate();
  date.setDate(day + 1);
  return date;
};
