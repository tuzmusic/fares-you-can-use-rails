Rails.application.routes.draw do
  namespace :api do
    resources :deals, :users
  end
end