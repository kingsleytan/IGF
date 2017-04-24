Rails.application.routes.draw do

  mount ActionCable.server => '/cable'
  
  root to: 'landing#index'
  resources :turnouts
  resources :pins

  resources :users, only: [:new, :edit, :create, :update]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]

  post :transfer, to: 'votes#upvote'
end
