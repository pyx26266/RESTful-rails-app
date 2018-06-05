Rails.application.routes.draw do
 
  get     '/login', to: "session#new"
  post    '/login', to: "session#create"
  delete  '/logout', to: "session#destroy"

  root to: 'users#index'
  
  resources :users, only: [:destroy, :new, :index, :create, :show]
end
