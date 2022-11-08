Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  resources :dashboard
  resources :home
  post '/auth/login', to: 'authentication#login'

  resources :bets, only: [:new, :create] do 
    collection do
      get 'all_causes_for_dropdown'
      get 'main_causes_for_dropdown'
      get 'sub_causes_for_dropdown'
    end
  end

  resources :causes, only: [:new, :create]
end
