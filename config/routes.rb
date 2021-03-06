Rails.application.routes.draw do

  mount MagicLamp::Genie, at: "/magic_lamp" if defined?(MagicLamp)

  # what are these??
  get 'regions/index'
  get 'regions/show'
  
  root "deals#index"
  
  resources :deals, param: :slug do
    resources :favorites
  end
  resources :favorites
  
  get 'my-deals', to: 'deals#my_deals', as: :my_deals_path
  resources :regions, param: :slug, only: [:index, :show] do
    resources :deals, only: [:index, :show], param: :slug
  end

  resource :preferences
  ActiveSupport::Inflector.inflections {|inflect| inflect.irregular 'preferences', 'preferences'} # fix route helper paths so that form_for works
  get '/preferences/delete_airport/:airport_id', to: 'preferences#destroy', as: 'delete_home_airport'

  resources :vacations
  
  get 'pry', to: 'application#pry'

  # ------- API STUFF --------
  namespace :api do
    resources :deals # auto-includes :show, :index
    get '/deals/from-airport/:iata', to: 'deals#from_airport'
    get '/deals/to-region/:slug', to: 'deals#to_region'
    get '/deals/for-vacation/:id', to: 'deals#for_vacation'
    # get 'deals/dates/:start_date/:end_date', to: 'deals#for_vacation'
    resources :users
    get '/users/:id/deals', to: 'users#deals'
    get '/users/:id/favorites', to: 'users#favorites'
    get '/user', to: 'users#show'
    get '/user/deals', to: 'users#deals'
    get '/user/favorites', to: 'users#favorites'
    post '/users/:user_id/airports', to: 'users#add_airport'
    delete '/users/:user_id/airports/:airport_id', to: 'users#delete_airport'
    post '/users/:user_id/vacations', to: 'users#add_vacation'
    delete '/users/:user_id/vacations/:vacation_id', to: 'users#delete_vacation'
    post '/user/favorites', to: 'users#add_favorite'
    post '/user/regions', to: 'users#add_region'
    resources :airports, param: :slug, only: [:index, :show]
  end

  # ------- DEVISE STUFF --------

  # https://www.facebook.com/v2.10/dialog/oauth?client_id&redirect_uri=
  # http%3A%2F%2Flocalhost%3A3000%2Fusers%2Fauth%2Ffacebook%2Fcallback&
  # response_type=code&scope=email&state=63ff1ab00e0e133ee3ded976a067cee9b011a09c8bae0717
  
  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks', 
    preferences: 'users/preferences',
  }

  devise_scope :user do 
    get "/sign_out", to: 'devise/sessions#destroy', as: 'user_sign_out'
    get "/sign_in", to: 'users/sessions#new', as: 'user_sign_in'
    get "/sign_up", to: 'devise/registrations#new', as: 'user_sign_up'
    get "/user/preferences", to: 'users/preferences#index', as: 'user_preferences'
    get "/user/preferences/edit", to: 'users/preferences#edit', as: 'edit_user_preferences'
    patch "/user/preferences/:id/edit", to: 'users/preferences#update'
  end

  devise_for :admins, path: 'admin', controllers: { sessions: 'admins/sessions' }

  devise_scope :admin do
    get "/admin", to: 'admins/sessions#portal', as: 'admin_root'
    get "/admin/sign_out", to: 'devise/sessions#destroy', as: 'admin_sign_out'
  end

end