class Deal {
  /*
   attributes :id, :headline, :description, :start_date, :end_date, :links, :region_name
  has_many :origins
  has_many :destinations

 */

  constructor({
    id,
    headline,
    description,
    start_date,
    end_date,
    region_name
  }) {
    this.id = id;
    this.headline = headline;
    this.description = description;
    this.start_date = start_date;
    this.end_date = end_date;
    this.region_name = region_name;
  }
}
