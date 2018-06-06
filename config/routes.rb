Rails.application.routes.draw do
 
  get     '/login', to: "session#new"
  post    '/login', to: "session#create"
  delete  '/logout', to: "session#destroy"

  root to: 'users#index'
  
  resources :users, only: [:new, :index, :create, :show]
  resources :rest_keys, only: [:create]
end
