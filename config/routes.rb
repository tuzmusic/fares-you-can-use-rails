Rails.application.routes.draw do
  devise_for :users
  get 'regions/index'
  get 'regions/show'
  resources :deals, param: :slug
  
  resources :regions, param: :slug, only: [:index, :show] do
    resources :deals, only: [:index, :show, :edit, :destroy]
  end

  root to: "deals#index"
  get 'sign_out', to: 'devise/sessions#destroy'
  get 'pry', to: 'application#pry'
end
