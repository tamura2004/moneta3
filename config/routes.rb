# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                                  root GET    /                                                                                        pages#show {:id=>1}
#                             lotteries GET    /lotteries(.:format)                                                                     lotteries#index
#                                       POST   /lotteries(.:format)                                                                     lotteries#create
#                           new_lottery GET    /lotteries/new(.:format)                                                                 lotteries#new
#                          edit_lottery GET    /lotteries/:id/edit(.:format)                                                            lotteries#edit
#                               lottery GET    /lotteries/:id(.:format)                                                                 lotteries#show
#                                       PATCH  /lotteries/:id(.:format)                                                                 lotteries#update
#                                       PUT    /lotteries/:id(.:format)                                                                 lotteries#update
#                                       DELETE /lotteries/:id(.:format)                                                                 lotteries#destroy
#                              branches GET    /branches(.:format)                                                                      branches#index
#                                       POST   /branches(.:format)                                                                      branches#create
#                            new_branch GET    /branches/new(.:format)                                                                  branches#new
#                           edit_branch GET    /branches/:id/edit(.:format)                                                             branches#edit
#                                branch GET    /branches/:id(.:format)                                                                  branches#show
#                                       PATCH  /branches/:id(.:format)                                                                  branches#update
#                                       PUT    /branches/:id(.:format)                                                                  branches#update
#                                       DELETE /branches/:id(.:format)                                                                  branches#destroy
#                                 pages GET    /pages(.:format)                                                                         pages#index
#                                       POST   /pages(.:format)                                                                         pages#create
#                              new_page GET    /pages/new(.:format)                                                                     pages#new
#                             edit_page GET    /pages/:id/edit(.:format)                                                                pages#edit
#                                  page GET    /pages/:id(.:format)                                                                     pages#show
#                                       PATCH  /pages/:id(.:format)                                                                     pages#update
#                                       PUT    /pages/:id(.:format)                                                                     pages#update
#                                       DELETE /pages/:id(.:format)                                                                     pages#destroy
#                             questions GET    /questions(.:format)                                                                     questions#index
#                                       POST   /questions(.:format)                                                                     questions#create
#                          new_question GET    /questions/new(.:format)                                                                 questions#new
#                         edit_question GET    /questions/:id/edit(.:format)                                                            questions#edit
#                              question GET    /questions/:id(.:format)                                                                 questions#show
#                                       PATCH  /questions/:id(.:format)                                                                 questions#update
#                                       PUT    /questions/:id(.:format)                                                                 questions#update
#                                       DELETE /questions/:id(.:format)                                                                 questions#destroy
#                              sessions GET    /sessions(.:format)                                                                      sessions#index
#                                       POST   /sessions(.:format)                                                                      sessions#create
#                           new_session GET    /sessions/new(.:format)                                                                  sessions#new
#                          edit_session GET    /sessions/:id/edit(.:format)                                                             sessions#edit
#                               session GET    /sessions/:id(.:format)                                                                  sessions#show
#                                       PATCH  /sessions/:id(.:format)                                                                  sessions#update
#                                       PUT    /sessions/:id(.:format)                                                                  sessions#update
#                                       DELETE /sessions/:id(.:format)                                                                  sessions#destroy
#                                 users GET    /users(.:format)                                                                         users#index
#                                       POST   /users(.:format)                                                                         users#create
#                              new_user GET    /users/new(.:format)                                                                     users#new
#                             edit_user GET    /users/:id/edit(.:format)                                                                users#edit
#                                  user GET    /users/:id(.:format)                                                                     users#show
#                                       PATCH  /users/:id(.:format)                                                                     users#update
#                                       PUT    /users/:id(.:format)                                                                     users#update
#                                       DELETE /users/:id(.:format)                                                                     users#destroy
#                    account_statements GET    /accounts/:account_id/statements(.:format)                                               statements#index
#                                       POST   /accounts/:account_id/statements(.:format)                                               statements#create
#                 new_account_statement GET    /accounts/:account_id/statements/new(.:format)                                           statements#new
#                edit_account_statement GET    /accounts/:account_id/statements/:id/edit(.:format)                                      statements#edit
#                     account_statement GET    /accounts/:account_id/statements/:id(.:format)                                           statements#show
#                                       PATCH  /accounts/:account_id/statements/:id(.:format)                                           statements#update
#                                       PUT    /accounts/:account_id/statements/:id(.:format)                                           statements#update
#                                       DELETE /accounts/:account_id/statements/:id(.:format)                                           statements#destroy
#                              accounts GET    /accounts(.:format)                                                                      accounts#index
#                                       POST   /accounts(.:format)                                                                      accounts#create
#                          edit_account GET    /accounts/:id/edit(.:format)                                                             accounts#edit
#                               account GET    /accounts/:id(.:format)                                                                  accounts#show
#                                       PATCH  /accounts/:id(.:format)                                                                  accounts#update
#                                       PUT    /accounts/:id(.:format)                                                                  accounts#update
#                                       DELETE /accounts/:id(.:format)                                                                  accounts#destroy
#                   new_product_account GET    /products/:product_id/accounts/new(.:format)                                             accounts#new
#                              products GET    /products(.:format)                                                                      products#index
#                                       POST   /products(.:format)                                                                      products#create
#                           new_product GET    /products/new(.:format)                                                                  products#new
#                          edit_product GET    /products/:id/edit(.:format)                                                             products#edit
#                               product GET    /products/:id(.:format)                                                                  products#show
#                                       PATCH  /products/:id(.:format)                                                                  products#update
#                                       PUT    /products/:id(.:format)                                                                  products#update
#                                       DELETE /products/:id(.:format)                                                                  products#destroy
#                         bank_transfer POST   /transfer/bank(.:format)                                                                 transfers#bank
#                       branch_transfer POST   /transfer/branch(.:format)                                                               transfers#branch
#                      account_transfer POST   /transfer/account(.:format)                                                              transfers#account
#                          new_transfer GET    /transfer/new(.:format)                                                                  transfers#new
#                         edit_transfer GET    /transfer/edit(.:format)                                                                 transfers#edit
#                              transfer GET    /transfer(.:format)                                                                      transfers#show
#                                       PATCH  /transfer(.:format)                                                                      transfers#update
#                                       PUT    /transfer(.:format)                                                                      transfers#update
#                                       DELETE /transfer(.:format)                                                                      transfers#destroy
#                                       POST   /transfer(.:format)                                                                      transfers#create
#                    admin_state_issues GET    /admin/state/:state_id/issues(.:format)                                                  admin/issues#index
#                                       POST   /admin/state/:state_id/issues(.:format)                                                  admin/issues#create
#                 new_admin_state_issue GET    /admin/state/:state_id/issues/new(.:format)                                              admin/issues#new
#                edit_admin_state_issue GET    /admin/state/:state_id/issues/:id/edit(.:format)                                         admin/issues#edit
#                     admin_state_issue GET    /admin/state/:state_id/issues/:id(.:format)                                              admin/issues#show
#                                       PATCH  /admin/state/:state_id/issues/:id(.:format)                                              admin/issues#update
#                                       PUT    /admin/state/:state_id/issues/:id(.:format)                                              admin/issues#update
#                                       DELETE /admin/state/:state_id/issues/:id(.:format)                                              admin/issues#destroy
#                     admin_state_index GET    /admin/state(.:format)                                                                   admin/state#index
#                                       POST   /admin/state(.:format)                                                                   admin/state#create
#                       new_admin_state GET    /admin/state/new(.:format)                                                               admin/state#new
#                      edit_admin_state GET    /admin/state/:id/edit(.:format)                                                          admin/state#edit
#                           admin_state GET    /admin/state/:id(.:format)                                                               admin/state#show
#                                       PATCH  /admin/state/:id(.:format)                                                               admin/state#update
#                                       PUT    /admin/state/:id(.:format)                                                               admin/state#update
#                                       DELETE /admin/state/:id(.:format)                                                               admin/state#destroy
#                          api_v1_pages GET    /api/v1/pages(.:format)                                                                  api/v1/pages#index {:format=>/json/}
#                                       POST   /api/v1/pages(.:format)                                                                  api/v1/pages#create {:format=>/json/}
#                       new_api_v1_page GET    /api/v1/pages/new(.:format)                                                              api/v1/pages#new {:format=>/json/}
#                      edit_api_v1_page GET    /api/v1/pages/:id/edit(.:format)                                                         api/v1/pages#edit {:format=>/json/}
#                           api_v1_page GET    /api/v1/pages/:id(.:format)                                                              api/v1/pages#show {:format=>/json/}
#                                       PATCH  /api/v1/pages/:id(.:format)                                                              api/v1/pages#update {:format=>/json/}
#                                       PUT    /api/v1/pages/:id(.:format)                                                              api/v1/pages#update {:format=>/json/}
#                                       DELETE /api/v1/pages/:id(.:format)                                                              api/v1/pages#destroy {:format=>/json/}
#                          api_v1_users GET    /api/v1/users(.:format)                                                                  api/v1/users#index {:format=>/json/}
#                                       POST   /api/v1/users(.:format)                                                                  api/v1/users#create {:format=>/json/}
#                       new_api_v1_user GET    /api/v1/users/new(.:format)                                                              api/v1/users#new {:format=>/json/}
#                      edit_api_v1_user GET    /api/v1/users/:id/edit(.:format)                                                         api/v1/users#edit {:format=>/json/}
#                           api_v1_user GET    /api/v1/users/:id(.:format)                                                              api/v1/users#show {:format=>/json/}
#                                       PATCH  /api/v1/users/:id(.:format)                                                              api/v1/users#update {:format=>/json/}
#                                       PUT    /api/v1/users/:id(.:format)                                                              api/v1/users#update {:format=>/json/}
#                                       DELETE /api/v1/users/:id(.:format)                                                              api/v1/users#destroy {:format=>/json/}
#                       api_v1_accounts GET    /api/v1/accounts(.:format)                                                               api/v1/accounts#index {:format=>/json/}
#                                       POST   /api/v1/accounts(.:format)                                                               api/v1/accounts#create {:format=>/json/}
#                    new_api_v1_account GET    /api/v1/accounts/new(.:format)                                                           api/v1/accounts#new {:format=>/json/}
#                   edit_api_v1_account GET    /api/v1/accounts/:id/edit(.:format)                                                      api/v1/accounts#edit {:format=>/json/}
#                        api_v1_account GET    /api/v1/accounts/:id(.:format)                                                           api/v1/accounts#show {:format=>/json/}
#                                       PATCH  /api/v1/accounts/:id(.:format)                                                           api/v1/accounts#update {:format=>/json/}
#                                       PUT    /api/v1/accounts/:id(.:format)                                                           api/v1/accounts#update {:format=>/json/}
#                                       DELETE /api/v1/accounts/:id(.:format)                                                           api/v1/accounts#destroy {:format=>/json/}
#                     api_v1_statements GET    /api/v1/statements(.:format)                                                             api/v1/statements#index {:format=>/json/}
#                                       POST   /api/v1/statements(.:format)                                                             api/v1/statements#create {:format=>/json/}
#                  new_api_v1_statement GET    /api/v1/statements/new(.:format)                                                         api/v1/statements#new {:format=>/json/}
#                 edit_api_v1_statement GET    /api/v1/statements/:id/edit(.:format)                                                    api/v1/statements#edit {:format=>/json/}
#                      api_v1_statement GET    /api/v1/statements/:id(.:format)                                                         api/v1/statements#show {:format=>/json/}
#                                       PATCH  /api/v1/statements/:id(.:format)                                                         api/v1/statements#update {:format=>/json/}
#                                       PUT    /api/v1/statements/:id(.:format)                                                         api/v1/statements#update {:format=>/json/}
#                                       DELETE /api/v1/statements/:id(.:format)                                                         api/v1/statements#destroy {:format=>/json/}
#                          api_v1_banks GET    /api/v1/banks(.:format)                                                                  api/v1/banks#index {:format=>/json/}
#                                       POST   /api/v1/banks(.:format)                                                                  api/v1/banks#create {:format=>/json/}
#                       new_api_v1_bank GET    /api/v1/banks/new(.:format)                                                              api/v1/banks#new {:format=>/json/}
#                      edit_api_v1_bank GET    /api/v1/banks/:id/edit(.:format)                                                         api/v1/banks#edit {:format=>/json/}
#                           api_v1_bank GET    /api/v1/banks/:id(.:format)                                                              api/v1/banks#show {:format=>/json/}
#                                       PATCH  /api/v1/banks/:id(.:format)                                                              api/v1/banks#update {:format=>/json/}
#                                       PUT    /api/v1/banks/:id(.:format)                                                              api/v1/banks#update {:format=>/json/}
#                                       DELETE /api/v1/banks/:id(.:format)                                                              api/v1/banks#destroy {:format=>/json/}
#                       api_v1_branches GET    /api/v1/branches(.:format)                                                               api/v1/branches#index {:format=>/json/}
#                                       POST   /api/v1/branches(.:format)                                                               api/v1/branches#create {:format=>/json/}
#                     new_api_v1_branch GET    /api/v1/branches/new(.:format)                                                           api/v1/branches#new {:format=>/json/}
#                    edit_api_v1_branch GET    /api/v1/branches/:id/edit(.:format)                                                      api/v1/branches#edit {:format=>/json/}
#                         api_v1_branch GET    /api/v1/branches/:id(.:format)                                                           api/v1/branches#show {:format=>/json/}
#                                       PATCH  /api/v1/branches/:id(.:format)                                                           api/v1/branches#update {:format=>/json/}
#                                       PUT    /api/v1/branches/:id(.:format)                                                           api/v1/branches#update {:format=>/json/}
#                                       DELETE /api/v1/branches/:id(.:format)                                                           api/v1/branches#destroy {:format=>/json/}
#                       api_v1_products GET    /api/v1/products(.:format)                                                               api/v1/products#index {:format=>/json/}
#                                       POST   /api/v1/products(.:format)                                                               api/v1/products#create {:format=>/json/}
#                    new_api_v1_product GET    /api/v1/products/new(.:format)                                                           api/v1/products#new {:format=>/json/}
#                   edit_api_v1_product GET    /api/v1/products/:id/edit(.:format)                                                      api/v1/products#edit {:format=>/json/}
#                        api_v1_product GET    /api/v1/products/:id(.:format)                                                           api/v1/products#show {:format=>/json/}
#                                       PATCH  /api/v1/products/:id(.:format)                                                           api/v1/products#update {:format=>/json/}
#                                       PUT    /api/v1/products/:id(.:format)                                                           api/v1/products#update {:format=>/json/}
#                                       DELETE /api/v1/products/:id(.:format)                                                           api/v1/products#destroy {:format=>/json/}
#                                signin GET    /signin(.:format)                                                                        users#new
#                                 login GET    /login(.:format)                                                                         sessions#new
#                         session_forms POST   /sessions(.:format)                                                                      sessions#create
#                            user_forms POST   /users(.:format)                                                                         users#create
#                         account_forms POST   /accounts(.:format)                                                                      accounts#create
#                        transfer_forms POST   /transfers(.:format)                                                                     transfers#create
#                                issues POST   /admin/state/:state_id/issues(.:format)                                                  admin/issues#create
#                                 issue POST   /admin/state/:state_id/issues/:id(.:format)                                              admin/issues#update
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#   rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#health_check
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#     new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#    edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  get 'currency/index'
  get 'currency/show'
  root to: "pages#show", id: 1

  resources :lotteries
  resources :branches
  resources :pages
  resources :questions
  resources :sessions
  resources :users
  resources :currencies

  resources :accounts, except: :new do
    resources :statements
  end

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

  namespace :admin do
    resources :state do
      resources :issues
    end
  end

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

  get "/signin", to: "users#new", as: "signin"
  get "/login", to: "sessions#new", as: "login"

  post "/sessions", to: "sessions#create", as: "session_forms"
  post "/users", to: "users#create", as: "user_forms"
  post "/accounts", to: "accounts#create", as: "account_forms"
  post "/transfers", to: "transfers#create", as: "transfer_forms"
  post "/admin/state/:state_id/issues", to: "admin/issues#create", as: "issues"
  post "/admin/state/:state_id/issues/:id", to: "admin/issues#update", as: "issue"
end
