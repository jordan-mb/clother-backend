Clothing::Application.routes.draw do

  root :to => "photos#new"

  devise_for :users
  resources :photos, :only => [:new, :create, :index, :show]

  get '/photos/:id/show_file', to: 'photos#show_file'
  post '/photos/:id/update_tags', to: 'photos#update_tags'
end
