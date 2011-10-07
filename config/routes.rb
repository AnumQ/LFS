LFS::Application.routes.draw do
  
  get "users_index" => 'users#index'
  resources :users
  match '/list_members' => 'users#index', :as => 'list'
  #ROOT path
  root :to => 'dashboard#index'
  
  
  resources :jamaats
  get "jamaats/jm" => 'jamaats#jm'
  match '/jamaat/:id' => 'jamaats#show', :as => 's_j'
  match '/list_jamaatsmembers/:id' => 'jamaats#jm', :as => 'j_m'
  
  
  resources :session, :only => [:new, :create, :delete]
  
  match '/login' => 'session#new', :as => 'login'
  match '/logout' => 'session#delete', :as => 'logout'
  match '/session' => 'session#create', :as => 'sessions'

end
