## Deals
X DealsController - admin CUD actions
X Deals Show page (so there's something to redirect to after creation)
X Deals New/Edit views
X Seed actual deals 
X Deals Index Page for admin 
  X Not navigable or filtered, yet
X Edit deals page/action
X Delete deal option on index/edit/show pages

## Regions
- Regions database
  X Define regions outside US by continent/country
  X Add continent to countries model (from DB)
  - Separate US regions by longitude/latitude
X Airport#region
X Deal#region
X Fix airports without states/regions
X Navigable deals index actions/views by location (nested resources; regions inside deals)
- Resource should actually be deals:regions:deals but show path should be /deals/region-name/deal-name)

## Users
X Create users resource

### Sign-up
X UsersController - create action
- FB authorization

### Sign-in
X Use Devise gem? (or other gem? see authentication-and-authorization readme)
X SessionsController (create and destroy only)

## UI Interlude
X Bootstrap review
X Create Layout
  X nav bar
  X login/hello in navbar
X Slugify deals

## Access Control
- Create Admin resource?
- Access control for Admin routes (deals#create, etc)

## Pre-Your deals
- User edit action
- User edit (prefs) view

## Your Deals
- New User view - welcome pages (see "Configuring views" in Devise)
  - Includes deals preferences, so lots of nested attributes here
- Add login to welcome/splash page (for existing user instead of new visitor)
- Deals.for_user class/scope method
  - Could also be User#deals, but (1) that would be calling scope methods on Deal anyway, and (2) the project requires scope methods
- Deals index for users 
- Deals index for visitors

## Admin insights
- Add stats to admin deals show/index pages (# of users who match each deal)
- Users index page (for admins), to ability to sort # and recency of deals per user