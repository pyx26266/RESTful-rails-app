Rails.application.routes.draw do
 
  root to: 'users#index'
  
  resources :users, only: [:destroy, :new, :index, :create]
end
