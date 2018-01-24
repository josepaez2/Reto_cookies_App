Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # SI QUIERES VER LAS RUTAS MIRA EN RAILS ROUTES
  root 'users#index'
  get 'announcements/index'
  get 'announcements/show'
  get 'announcements/new'
  get 'announcements/create'
  get 'announcements/destroy'

  # For customizing routes:
  # devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }


#                   Prefix Verb   URI Pattern                      Controller#Action
#                     root GET    /                                users#index

#         new_user_session GET    /users/sign_in(.:format)         devise/sessions#new
#             user_session POST   /users/sign_in(.:format)         devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)        devise/sessions#destroy
#        new_user_password GET    /users/password/new(.:format)    devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)   devise/passwords#edit
#            user_password PATCH  /users/password(.:format)        devise/passwords#update
#                          PUT    /users/password(.:format)        devise/passwords#update
#                          POST   /users/password(.:format)        devise/passwords#create
# cancel_user_registration GET    /users/cancel(.:format)          devise/registrations#cancel
#    new_user_registration GET    /users/sign_up(.:format)         devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)            devise/registrations#edit
#        user_registration PATCH  /users(.:format)                 devise/registrations#update
#                          PUT    /users(.:format)                 devise/registrations#update
#                          DELETE /users(.:format)                 devise/registrations#destroy
#                          POST   /users(.:format)                 devise/registrations#create

#      announcements_index GET    /announcements/index(.:format)   announcements#index
#       announcements_show GET    /announcements/show(.:format)    announcements#show
#        announcements_new GET    /announcements/new(.:format)     announcements#new
#     announcements_create GET    /announcements/create(.:format)  announcements#create
#    announcements_destroy GET    /announcements/destroy(.:format) announcements#destroy
end
