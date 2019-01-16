# Routes & Views

## Display/browsing - BASIC CMS
- `/deals` - lists all deals (basically a blog index)
  - Right half shows all deals, left half shows your deals (logged in) or a "Sign up!" screen (logged out)
- `/deals/slug` - Shows a deal (basically a blog show) - slug is title of blog post (`deal.headline`)
- `/regions` - Lists all regions for drilldown
- `/region/slug` - Shows a region (lists its cities AND airports)
  - And/or all deals for the region (eliminating the need for `/region/slug/deals`)
- `/region/slug/deals` - Shows deals for a region
- `/region/region_slug/city_slug` - Shows deals for a city? No reason to have to click further into airports. So, no reason for a 'deals' path on this?
- all of the above link to nested deal show pages

## Setting your prefs
- `/welcome` - Log in, or Sign Up and set your vacations and destinations, from the welcome page (yay! set up your stuff!)
  - `/welcome/destinations` - Maybe the first welcome page (splash page) has you create your credentials (or connect your facebook) and select your destinations (simple list of regions at first; when more detail is available let them select just a few to make it less overwhelming) and then directs them to:
  - `/welcome/vacation_dates` (or `/welcome/vacations`) - Where they set some vacation dates
  - then redirects to `/deals`
- `/prefs` - Edit prefs for already created user