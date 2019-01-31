Rails.application.routes.draw do
  # devise_for :admins
  get 'regions/index'
  get 'regions/show'

  root to: "deals#index"
  
  resources :deals, param: :slug
  resources :regions, param: :slug, only: [:index, :show] do
    resources :deals, only: [:index, :show, :edit, :destroy]
  end

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

  get 'pry', to: 'application#pry'
end

=begin
Configuring routes

Devise also ships with default routes. If you need to customize them, you should probably be able to do it through the devise_for method. It accepts several options like :class_name, :path_prefix and so on, including the possibility to change path names for I18n:

devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
Be sure to check devise_for documentation for details.

If you have the need for more deep customization, for instance to also allow "/sign_in" besides "/users/sign_in", all you need to do is create your routes normally and wrap them in a devise_scope block in the router:

devise_scope :user do
  get 'sign_in', to: 'devise/sessions#new'
end
This way, you tell Devise to use the scope :user when "/sign_in" is accessed. Notice devise_scope is also aliased as as in your router.

=end