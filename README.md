# README

# Fares You Can Use

A Rails web app for users to see flight deals that match their home airports, favorite destinations, and vacation dates.

## Getting Started

- Run `bundle install` to install gems 
- Run `rake db:seed` to open the seeding CLI
  - Select "T" to seed the static databases (`Airports`, `Regions`, etc.) required for database operations. This will take a few minutes.
  - Select "D" to seed some sample deals, if you'd like.
- Run `rails server` to start the server, then access the website from a browser at `localhost:3000`

### Admin Users
- Admins cannot be created from the browser, and must be created from the `rails console` using `Admin.create(email, password)`

## Running the tests

- Run `rake db:seed RAILS_ENV=test` and select "T" to seed the static databases (`Airports`, `Regions`, etc.) required for database operations. This will take a few minutes.
  - Other databases are reset between tests. The static databases are set to be left alone, but sometimes they do get cleaned and you'll need to seed them again.
- As of the last edit on this README, tests have not been updated to pass the current state of the project.

## Contributing

Please read [CONTRIBUTING.md] for details on our code of conduct, and the process for submitting pull requests to us.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

