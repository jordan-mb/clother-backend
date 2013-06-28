Clothing::Application.routes.draw do

  root :to => "photos#new"

  devise_for :users
  resources :photos, :only => [:new, :create, :index]

  get '/photos/:id/show_file', to: 'photos#show_file'
end
