# API Documentation

## Deals

- Get ALL deals
  + `/api/deals/`

- Get deals from a given airport iata code
  + `api/deals/from/:iata`

- Get deals to a given airport iata code
  + `api/deals/to/:iata`

- Get deals to a given region
  + `api/deals/to/:region_slug`

- Get deals during a certain date range
  + `api/deals/dates/:start_date/:end_date`

## Users

- Get all users
  + `api/users/`

- Get a user by ID
  + `api/users/:id`

- Get a user's favorite deals
  + `api/users/:id/favorites`

- Get all the user's matching deals
  + `api/users/:id/deals`

## Current User

- Get the current logged in user
  + `api/user/`

- Get the logged in user's favorite deals
  + `api/user/favorites`

- Get all the logged in user's matching deals
  + `api/user/deals`