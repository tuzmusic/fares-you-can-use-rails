# Models - Info Database

## Deals
- headline
- description
- start_date
- end_date
- Location: Don't worry about the details of this just yet? Mainly since they are "static entities" in a database. All we need to know initially for planning is that a deal has a location.
  - has_many :airports
    - Deals are by airport, but users search/prefer by region (and also by airport? by city? is it a big difference?)
  - #region, #city, #country, etc, get info about the location. 
    - Do these methods care that a deal may have many airports but those airports will all be in the same region (and possibly city)?
- 

## Regions
- has_many :airports
- has_many :cities

## Airports
- managed by Airports gem? Probably. check out its database entries and properties.
- belongs_to :region
- belongs_to :city (Airports has a city property so this is probably managed with a scope method rather than an actual association)

---
# Models - User Prefs

## Users
- first_name
- last_name
- email
- facebook auth whatever
- has_many :vacations (dates)
  - should be called :dates or something? :vacation_dates? (no, that sounds like a join table)
- has_many :locations (or :destinations or something -- or :favorite_locations or :dream_destinations or some BS like that)
  - Can be a region, country, city, airport? Or is Location (or Destination) an *object* that can be any of those things?
- has_many :deals (bookmarks)

## Vacations
- belongs_to :user
  - users with identical vacation dates... don't need to share the same Vacation object, right?
- start_date
- end_date
- #deals => Deals that fit this vacation - all deals, filtered by dates