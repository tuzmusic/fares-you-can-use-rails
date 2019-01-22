# Regions
```ruby
class Airport
  def region
    continent = Ravibhim::Continents::get_continent(self.country)
    if country_region = Region.find_by(name: self.country) # If this country isn't considered its own region (takes care of Mexico and Canada)
      country_region
    elsif continent_region = Region.find_by(name: self.continent)
      continent_region
    else
      Region.usa_region_for_airport(self)
    end
  end
end

class Region
  def self.usa_region_for_airport(airport)
    
  end
end
```

The region of an airport should be its continent
Unless it's in north america
Mexico and Canada will be their own regions
States of the US will be in US regions
  Northeast
  Southeast
  Midwest
  South
  Southwest
  Northwest
  (others)

