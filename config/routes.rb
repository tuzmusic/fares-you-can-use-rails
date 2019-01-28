Rails.application.routes.draw do
  get 'regions/index'
  get 'regions/show'
  resources :deals, param: :slug
  
  resources :regions, param: :slug, only: [:index, :show] do
    resources :deals, only: [:index, :show, :edit, :destroy]
  end

  root to: "deals#index"

  # Omniauth
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }  
  # devise_scope :user do
  #   delete 'sign_out', to:'devise/sessions#destroy', as: :destroy_user_session
  # end

  get 'pry', to: 'application#pry'
end
