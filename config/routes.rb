Rails.application.routes.draw do
  root to: "pages#show", id: 1

  resources :accounts
  resources :branches
  resources :pages
  resources :questions
  resources :sessions
  resources :transfers
  resources :users

  get "/login", to: "pages#login"
  get "/signin", to: "users#new"

  namespace :api, { format: "json" } do
    namespace :v1 do
      resources :users
    end
  end
end
