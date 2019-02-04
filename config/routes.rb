Rails.application.routes.draw do

  # what are these??
  get 'regions/index'
  get 'regions/show'
  
  root "deals#index"
  
  resources :deals, param: :slug
  resources :regions, param: :slug, only: [:index, :show] do
    resources :deals, only: [:index, :show, :edit, :destroy]
  end

  resource :preferences
  ActiveSupport::Inflector.inflections {|inflect| inflect.irregular 'preferences', 'preferences'}
  resources :vacations
  
  get 'pry', to: 'application#pry'

  # ------- DEVISE STUFF --------

  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks', 
    preferences: 'users/preferences' 
  }

  devise_scope :user do 
    get "/sign_out", to: 'devise/sessions#destroy', as: 'user_sign_out'
    get "/sign_in", to: 'devise/sessions#new', as: 'user_sign_in'
    get "/sign_up", to: 'devise/registrations#new', as: 'user_sign_up'
    get "/user/preferences", to: 'users/preferences#index', as: 'user_preferences'
    get "/user/preferences/edit", to: 'users/preferences#edit', as: 'edit_user_preferences'
    patch "/user/preferences/:id/edit", to: 'users/preferences#update'
  end

  devise_for :admins, path: 'admin', controllers: { sessions: 'admins/sessions' }

  devise_scope :admin do
    get "/admin", to: 'admins/sessions#portal', as: 'admin_root'
    get "/admin/sign_out", to: 'admin/sessions#destroy', as: 'admin_sign_out'
  end

end