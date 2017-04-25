Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  root to: 'landing#index'
  resources :turnouts

  resources :users
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]

  resources :pins
  get :newpintransfer, to: 'pins#newpintransfer'
  post :transferpin, to: 'pins#transferpin'
  post :addpin, to: 'pins#addpin'
  post :deductpin, to: 'pins#deductpin'

  resources :cashes
  get :newcashtransfer, to: 'cashes#newcashtransfer'
  post :transfercash, to: 'cashes#transfercash'
  post :addcash, to: 'cashes#addcash'
  post :deductcash, to: 'cashes#deductcash'
end
