Rails.application.routes.draw do
  root to: 'landing#index'
  resources :turnouts
  resources :users, only: [:new, :edit, :create, :update]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
end
