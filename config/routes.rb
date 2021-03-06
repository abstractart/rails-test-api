Rails.application.routes.draw do
  root 'stats#index'

  namespace :api do
    namespace :v1 do
      resources :users, only: :create
      resources :messages, only: %i[index create] do
        resources :votes, only: :create
        get :search, on: :collection
      end
      post 'user_token' => 'user_token#create'
    end
  end
  resources :stats, only: :index
end
