# API Documentation

## Deals

[X] Get ALL deals
  + `/api/deals/`

[X] Get a deal by id
  + `/api/deals/:id`

[X] Get deals from a given airport iata code
  + `GET api/deals/from/:iata`

<!-- [] Get deals to a given airport iata code
  + `GET api/deals/to/:iata` -->

[X] Get deals to a given region
  + `GET api/deals/to/:region_slug`

[X] Get deals during a certain vacation
  + `GET api/deals/for-vacation/:id`

[] Get deals during a certain date range
  + `GET api/deals/dates/:start_date/:end_date`

## Users

[X] Get all users
  + `GET api/users/`

[X] Get a user by ID
  + `GET api/users/:id`

[X] Get a user's favorite deals
  + `GET api/users/:id/favorites`

[X] Get all the user's matching deals
  + `GET api/users/:id/deals`

## Current User
[X] Get the current logged in user (includes deals grouped by vacation)
  + `GET api/user/`

[X] Get the logged in user's favorite deals
  + `GET api/user/favorites`

[X] Get all the logged in user's matching deals, grouped by vacation
  + `GET api/user/deals`

[ ] Get all the logged in user's vacations
  + `GET api/user/vacations`

## Editing Preferences for Current User
[X] Add a home airport to the current user's prefs
  + `POST api/user/airports` 
    + {iata: AIRPORT_IATA_CODE}
[ ] Delete a home airport from the current user's prefs
  + `DELETE /users/:user_id/airports/:airport_id` 
[ ] Add a vacation to the current user's prefs
  + `POST api/user/vacations`
[ ] Add a favorite to the current user's prefs
  + `POST api/user/favorites`
[ ] Add a region ("destination") to the current user's prefs
  + `POST api/user/regions`