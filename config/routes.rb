# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#         new_admin_session GET    /admins/sign_in(.:format)                                                                admins/sessions#new
#             admin_session POST   /admins/sign_in(.:format)                                                                admins/sessions#create
#     destroy_admin_session DELETE /admins/sign_out(.:format)                                                               admins/sessions#destroy
#        new_admin_password GET    /admins/password/new(.:format)                                                           admins/passwords#new
#       edit_admin_password GET    /admins/password/edit(.:format)                                                          admins/passwords#edit
#            admin_password PATCH  /admins/password(.:format)                                                               admins/passwords#update
#                           PUT    /admins/password(.:format)                                                               admins/passwords#update
#                           POST   /admins/password(.:format)                                                               admins/passwords#create
# cancel_admin_registration GET    /admins/cancel(.:format)                                                                 admins/registrations#cancel
#    new_admin_registration GET    /admins/sign_up(.:format)                                                                admins/registrations#new
#   edit_admin_registration GET    /admins/edit(.:format)                                                                   admins/registrations#edit
#        admin_registration PATCH  /admins(.:format)                                                                        admins/registrations#update
#                           PUT    /admins(.:format)                                                                        admins/registrations#update
#                           DELETE /admins(.:format)                                                                        admins/registrations#destroy
#                           POST   /admins(.:format)                                                                        admins/registrations#create
#          new_user_session GET    /users/sign_in(.:format)                                                                 users/sessions#new
#              user_session POST   /users/sign_in(.:format)                                                                 users/sessions#create
#      destroy_user_session DELETE /users/sign_out(.:format)                                                                users/sessions#destroy
#         new_user_password GET    /users/password/new(.:format)                                                            users/passwords#new
#        edit_user_password GET    /users/password/edit(.:format)                                                           users/passwords#edit
#             user_password PATCH  /users/password(.:format)                                                                users/passwords#update
#                           PUT    /users/password(.:format)                                                                users/passwords#update
#                           POST   /users/password(.:format)                                                                users/passwords#create
#  cancel_user_registration GET    /users/cancel(.:format)                                                                  users/registrations#cancel
#     new_user_registration GET    /users/sign_up(.:format)                                                                 users/registrations#new
#    edit_user_registration GET    /users/edit(.:format)                                                                    users/registrations#edit
#         user_registration PATCH  /users(.:format)                                                                         users/registrations#update
#                           PUT    /users(.:format)                                                                         users/registrations#update
#                           DELETE /users(.:format)                                                                         users/registrations#destroy
#                           POST   /users(.:format)                                                                         users/registrations#create
#                     users GET    /users(.:format)                                                                         users#index
#                 edit_user GET    /users/:id/edit(.:format)                                                                users#edit
#                      user GET    /users/:id(.:format)                                                                     users#show
#                           PATCH  /users/:id(.:format)                                                                     users#update
#                           PUT    /users/:id(.:format)                                                                     users#update
#                           DELETE /users/:id(.:format)                                                                     users#destroy
#                    admins GET    /admins(.:format)                                                                        admins#index
#                     admin GET    /admins/:id(.:format)                                                                    admins#show
#               user_delete DELETE /admins/user_delete/:id(.:format)                                                        admins#destroy
#               post_images GET    /post_images(.:format)                                                                   post_images#index
#                           POST   /post_images(.:format)                                                                   post_images#create
#            new_post_image GET    /post_images/new(.:format)                                                               post_images#new
#                post_image GET    /post_images/:id(.:format)                                                               post_images#show
#                           DELETE /post_images/:id(.:format)                                                               post_images#destroy
#                    groups POST   /groups(.:format)                                                                        groups#create
#                     group GET    /groups/:id(.:format)                                                                    groups#show
#                           PATCH  /groups/:id(.:format)                                                                    groups#update
#                           PUT    /groups/:id(.:format)                                                                    groups#update
#                   sakujyo POST   /groups/:id(.:format)                                                                    groups#sakujyo
#                 histories GET    /histories(.:format)                                                                     histories#index
#                           POST   /histories(.:format)                                                                     histories#create
#               new_history GET    /histories/new(.:format)                                                                 histories#new
#                   history DELETE /histories/:id(.:format)                                                                 histories#destroy
#               regulations POST   /regulations(.:format)                                                                   regulations#create
#                regulation DELETE /regulations/:id(.:format)                                                               regulations#destroy
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
#

Rails.application.routes.draw do

  get 'regulations/create'
  get 'regulations/destroy'
  get 'regulation/create'
  get 'regulation/destroy'
	devise_for :admins, controllers: {
	  sessions:      'admins/sessions',
	  passwords:     'admins/passwords',
	  registrations: 'admins/registrations'
	}
	devise_for :users, controllers: {
	  sessions:      'users/sessions',
	  passwords:     'users/passwords',
	  registrations: 'users/registrations'
	}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	 resources :users, only: [:index, :update, :show, :edit, :destroy]
	 resources :admins, only: [:index, :show]
  	 delete 'admins/user_delete/:id' => 'admins#destroy', as:'user_delete'
	 resources :post_images, only: [:new, :create, :index, :show, :destroy]
	 resources :groups, only: [:index, :create, :update, :show]
	 post 'groups/:id' => 'groups#sakujyo', as:'sakujyo'
	 # resources :histories, only: [:index, :new, :create, :destroy, :show]
	 resources :regulations, only: [:index, :create, :destroy]
end
