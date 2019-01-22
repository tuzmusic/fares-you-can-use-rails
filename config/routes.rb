Rails.application.routes.draw do
  resources :deals
  get 'pry', to: 'application#pry'
end
