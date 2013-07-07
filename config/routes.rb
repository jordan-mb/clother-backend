Clothing::Application.routes.draw do

  root :to => "photos#new"

  devise_for :users
  resources :photos, :only => [:new, :create, :index, :show, :destroy]
  resources :tags, :only => [:new, :create, :index, :show, :destroy]
  resources :users, :only => [:index, :show]
  resources :game, :only => [:index]

  get '/whoops', to: 'static#doesnt_exist'
  get '/pick_photo', to: 'photos#pick_photo'
  post '/photos/:id/update_tags', to: 'photos#update_tags'
  post '/photos/:id/love', to: 'photos#love'
  post '/photos/:id/hate', to: 'photos#hate'

  #api
  get '/pics', to: 'photos#index_json'
end
