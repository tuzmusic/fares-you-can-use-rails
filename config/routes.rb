Rails.application.routes.draw do
  # devise_for :admins
  get 'regions/index'
  get 'regions/show'

  root to: "deals#index"
  
  resources :deals, param: :slug
  resources :regions, param: :slug, only: [:index, :show] do
    resources :deals, only: [:index, :show, :edit, :destroy]
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }  
  devise_scope :user do get "/users/sign_out" => 'devise/sessions#destroy' end

  devise_for :admins, path: 'admin'

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