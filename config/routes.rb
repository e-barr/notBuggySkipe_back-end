Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      patch '/profile', to: 'users#update'

      mount ActionCable.server => '/cable'
    end
  end
end
