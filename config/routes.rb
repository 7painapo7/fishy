Rails.application.routes.draw do
  get 'groups/create'
  get 'groups/destroy'
  get 'histories/index'
  get 'histories/new'
  get 'histories/create'
  get 'histories/destroy'
  get 'regulation/new'
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
	 resources :groups, only: [:create, :update, :destroy]
end
