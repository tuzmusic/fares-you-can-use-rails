# Deals
- headline
- description
- start_date
- end_date
- has_many :airports
  - Deals are by airport, but users search/prefer by region (and also by airport? is it a big difference?)

# Regions
- has_many :airports
- has_many :cities

# Airports
- managed by Airports gem? Probably. check out its database entries and properties.
- belongs_to :region
- belongs_to :city