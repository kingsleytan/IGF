Rails.application.routes.draw do
  root to: 'landing#index'
  resources :user_attendance
end
