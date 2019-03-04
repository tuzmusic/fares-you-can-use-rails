# API Documentation

## Deals

[X] Get ALL deals
  + `/api/deals/`

[X] Get a deal by id
  + `/api/deals/:id`

[X] Get deals from a given airport iata code
  + `api/deals/from/:iata`

<!-- [] Get deals to a given airport iata code
  + `api/deals/to/:iata` -->

[X] Get deals to a given region
  + `api/deals/to/:region_slug`

[X] Get deals during a certain vacation
  + `api/deals/for-vacation/:id`

[] Get deals during a certain date range
  + `api/deals/dates/:start_date/:end_date`

## Users

[X] Get all users
  + `api/users/`

[X] Get a user by ID
  + `api/users/:id`

[X] Get a user's favorite deals
  + `api/users/:id/favorites`

[X] Get all the user's matching deals
  + `api/users/:id/deals`

## Current User
[X] Get the current logged in user
  + `api/user/`

[X] Get the logged in user's favorite deals
  + `api/user/favorites`

[X] Get all the logged in user's matching deals
  + `api/user/deals`

[ ] Get all the logged in user's vacations
  + `api/user/vacations`

[ ] Get all the logged in user's deals, grouped by vacation
  + `api/user/vacation-deals/`
    + For each vacation: `Deal.from_airports(user.home_airports).to_regions(user.regions).for_vacation vacation`