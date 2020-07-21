Rails.application.routes.draw do
  get 'statements/index'
  root to: "pages#show", id: 1

  resources :accounts, except: :new do
    resources :statements
  end
  resources :branches
  resources :pages
  resources :questions
  resources :sessions
  resources :users

  post "/sessions", to: "sessions#create", as: "session_forms"
  post "/users", to: "users#create", as: "user_forms"
  post "/accounts", to: "accounts#create", as: "account_forms"
  post "/transfers", to: "transfers#create", as: "transfer_forms"

  resources :products do
    resources :accounts, only: [:new]
  end

  resource :transfer do
    member do
      post :bank
      post :branch
      post :account
    end
  end

  get "/signin", to: "users#new", as: "signin"
  get "/login", to: "sessions#new", as: "login"

  namespace :api, { format: "json" } do
    namespace :v1 do
      resources :pages
      resources :users
      resources :accounts
      resources :statements
      resources :banks
      resources :branches
      resources :products
    end
  end
end
