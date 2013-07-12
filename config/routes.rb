Clothing::Application.routes.draw do

  root :to => "game#index"

  devise_for :users
  resources :photos, :only => [:new, :create, :index, :show, :destroy]
  resources :tags, :only => [:new, :create, :index, :show, :destroy]
  resources :users, :only => [:index, :show, :edit, :update]
  resources :coupons, :only => [:new, :create, :index, :show, :destroy]

  get '/whoops', to: 'static#doesnt_exist'
  get '/pick_photo', to: 'photos#pick_photo'
  get '/unapproved_users', to: 'users#users_awaiting_approval'
  post '/users/:id/approve', to: 'users#approve'
  post '/photos/:id/update_tags', to: 'photos#update_tags'
  post '/photos/:id/love', to: 'photos#love'
  post '/photos/:id/hate', to: 'photos#hate'

  #api
  get '/pics', to: 'photos#index_json'
end
