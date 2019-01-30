Rails.application.routes.draw do
  devise_for :admins
  get 'regions/index'
  get 'regions/show'
  resources :deals, param: :slug
  
  resources :regions, param: :slug, only: [:index, :show] do
    resources :deals, only: [:index, :show, :edit, :destroy]
  end

  root to: "deals#index"
  # get 'users/sign_out', to: 'devise/sessions#destroy'

  # Omniauth
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }  
  devise_scope :user do get "/users/sign_out" => 'devise/sessions#destroy' end

  get 'pry', to: 'application#pry'
end
