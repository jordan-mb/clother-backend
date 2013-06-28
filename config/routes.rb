Clothing::Application.routes.draw do

  root :to => "photos#new"

  devise_for :users
  resources :photos, :only => [:new, :create]
end
