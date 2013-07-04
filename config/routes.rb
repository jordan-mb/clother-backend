Clothing::Application.routes.draw do

  root :to => "photos#new"

  devise_for :users
  resources :photos, :only => [:new, :create, :index, :show, :destroy]
  resources :tags, :only => [:new, :create, :index, :show, :destroy]
  resources :users, :only => [:index, :show]

  get '/whoops', to: 'static#doesnt_exist'
  get '/photos/:id/show_file', to: 'photos#show_file'
  post '/photos/:id/update_tags', to: 'photos#update_tags'
  post '/photos/:id/love', to: 'photos#love'
  post '/photos/:id/hate', to: 'photos#hate'
  get '/jo', to: 'static#make_jo_admin'
end
