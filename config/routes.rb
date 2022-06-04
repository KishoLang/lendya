Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :items do
    resources :bookings, only: [:index, :new, :create ]
  end
    resources :bookings, only: [:show, :destroy ] do
      resources :messages, only: [:index, :new, :create]
      resources :reviews, only: [ :index, :new, :create]
    end
  get "dashboard", to: "dashboard#show"
  resources :messages, only: [:show]
  resources :reviews, only: [:show, :delete]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
