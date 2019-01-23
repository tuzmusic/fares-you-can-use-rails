Rails.application.routes.draw do
  get 'regions/index'
  get 'regions/show'
  resources :deals
  
  resources :regions, only: [:index, :show] do
    resources :deals
  end

  get 'pry', to: 'application#pry'
end
