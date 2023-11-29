Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'ping' => 'application#ping'

  # Defines the root path route ("/")
  # root "posts#index"
  namespace :api do
    namespace :v1 do
      get 'books' => 'books#index_all'
      resources :authors, only: [:index, :show, :create, :destroy] do
        resources :books, only: [:create, :index, :destroy]
      end
    end
  end
end
