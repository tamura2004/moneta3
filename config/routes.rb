Rails.application.routes.draw do
  root to: "pages#show", id: 1

  resources :accounts
  resources :branches
  resources :pages
  resources :questions
  resources :transfers

  get "/login", to: "pages#login"
  get "/signin", to: "pages#signin"
end
