Rails.application.routes.draw do

  root 'announcements#index'

  resources :announcements, except: [:edit, :update]
  devise_for :users, controllers: { sessions: 'users/sessions' }

 get '/announcements/history', to: "announcements#history" , as: "announcements_history"



  #   # For giving scope to parameters:
  # devise_scope :user do get "/users/sessions/index" => "users/sessions#index" end

  # For customizing routes:
  # devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

#                 Prefix Verb   URI Pattern                      Controller#Action
#            users_index GET    /users/sessions/index(.:format)  users/sessions#index
  # get '/users/sessions/index', to: "users/sessions#index" , as: "users_index"
  


#                   Prefix Verb   URI Pattern                      Controller#Action
#                     root GET    /                              announcements#index
#       announcement_index GET    /announcement(.:format)        announcements#index
#                          POST   /announcement(.:format)        announcements#create
#         new_announcement GET    /announcement/new(.:format)    announcements#new
#             announcement GET    /announcement/:id(.:format)    announcements#show
#         new_user_session GET    /users/sign_in(.:format)       users/sessions#new
#             user_session POST   /users/sign_in(.:format)       users/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      users/sessions#destroy
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#            user_password PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
#                          POST   /users/password(.:format)      devise/passwords#create
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
#        user_registration PATCH  /users(.:format)               devise/registrations#update
#                          PUT    /users(.:format)               devise/registrations#update
#                          DELETE /users(.:format)               devise/registrations#destroy
#                          POST   /users(.:format)               devise/registrations#create

end
