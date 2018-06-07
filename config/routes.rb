Rails.application.routes.draw do
 
  get     '/login', to: "session#new"
  post    '/login', to: "session#create"
  delete  '/logout', to: "session#destroy"

  root to: 'users#index'
  
  resources :users, only: [:new, :index, :create, :show, :destroy]
  resources :rest_keys, only: [:create]
  
  namespace 'api', defaults: {format: 'json'} do
    namespace 'v1' do
      # resources :requests
      get '/requests', to: "requests#index"
      post '/requests', to: "requests#show"
    end
  end
end
