Clothing::Application.routes.draw do

  root :to => "photos#new"

  devise_for :users
  resources :photos, :only => [:new, :create, :index, :show, :destroy]
  resources :tags, :only => [:new, :create]

  get '/photos/:id/show_file', to: 'photos#show_file'
  post '/photos/:id/update_tags', to: 'photos#update_tags'
  post '/photos/:id/love', to: 'photos#love'
  post '/photos/:id/hate', to: 'photos#hate'
end
