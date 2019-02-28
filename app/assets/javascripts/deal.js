class Deal {
  constructor({
    id,
    headline,
    description,
    start_date,
    end_date,
    region_name,
    links,
    origins,
    destinations
  }) {
    this.id = Number(id);
    this.headline = headline;
    this.description = description;
    // this.start_date = Date.fromRailsStr(start_date);
    this.start_date = new Date(start_date);
    this.end_date = new Date(end_date);
    // this.end_date = Date.fromRailsStr(end_date);
    this.region_name = region_name;
    this.origins = links;
    this.origins = origins;
    this.destinations = destinations;
  }
}
Date.fromRailsStr = function(str) {
  let date = new Date(str);
  let day = date.getDate();
  date.setDate(day + 1);
  return date;
};
