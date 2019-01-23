Rails.application.routes.draw do
  resources :deals
  
  resources :regions, only: [:index :show] do
    resources :deals
  end

  get 'pry', to: 'application#pry'
end
