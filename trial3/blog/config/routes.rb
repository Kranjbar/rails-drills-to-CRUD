Rails.application.routes.draw do
  get 'users/index'

  root to: "users#index"
  resources :users do
    resources :articles
  end
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create"
end