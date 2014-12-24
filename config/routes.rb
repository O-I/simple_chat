Rails.application.routes.draw do
  root to: 'comments#new'
  resources :comments, only: [:new, :create, :index]

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure',            to: 'sessions#auth_fail'
  get '/sign_out',                to: 'sessions#destroy', as: :sign_out
end