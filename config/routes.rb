Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  root to: 'landing#index'
  resources :turnouts
  resources :pins

  resources :users
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]

  get :newpintransfer, to: 'pins#newpintransfer'
  post :transferpin, to: 'pins#transferpin'
  post :addpin, to: 'pins#addpin'
  post :deductpin, to: 'pins#deductpin'
end
