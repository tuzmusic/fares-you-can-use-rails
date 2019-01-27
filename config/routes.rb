Rails.application.routes.draw do
  get 'regions/index'
  get 'regions/show'
  resources :deals, param: :slug
  
  # resources :regions, param: :slug, only: [:index, :show] do
  #   resources :deals
  # end

  resources :regions, param: :slug, only: [:index, :show] do
    resources :deals, only: [:index, :show, :edit, :destroy]
  end

  get 'pry', to: 'application#pry'
end
