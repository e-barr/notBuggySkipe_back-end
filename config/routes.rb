Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      patch '/profile', to: 'users#update'
      delete '/contacts', to: 'contacts#destroy'
      post '/contacts', to: 'contacts#create'
      get '/users', to: 'users#index'
      delete '/invites', to: 'invites#destroy'
      post '/invites', to: 'invites#create'
    end
  end
end
