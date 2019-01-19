## Deals
X DealsController - admin CUD actions
X Deals Show page (so there's something to redirect to after creation)
X Deals New/Edit views
- Seed actual deals 
- Deals Index Page for admin 
  - Not navigable or filtered, yet
- Delete deal option on index/edit/show pages

## Regions
- Regions database
  - Get countries gem, import countries to DB
  - Add continent to countries model (from DB)
  - Separate US regions by longitude/latitude
- Navigable deals index actions/views by location (nested resources; regions inside deals)

## Users
- Create users resource

### Sign-up
- UsersController - create action
- New User view - welcome pages
  - Includes deals preferences, so lots of nested attributes here
- FB authorization

### Sign-in
- Use Devise gem? (or other gem? see authentication-and-authorization readme)
- Add login to welcome/splash page
- SessionsController (create and destroy only)
- Access policy (require login)

## UI Interlude
- Bootstrap review
- Create Layout
  - nav bar
  - login/hello in navbar

## Pre-Your deals
- User edit action
- User edit (prefs) view

## Your Deals
- Deals.for_user class/scope method
  - Could also be User#deals, but (1) that would be calling scope methods on Deal anyway, and (2) the project requires scope methods
- Deals index for users 
- Deals index for visitors

## Admin insights
- Add stats to admin deals show/index pages (# of users who match each deal)
- Users index page (for admins), to ability to sort # and recency of deals per user