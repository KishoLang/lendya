Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :items do
    resources :bookings, only: [:index, :new, :create] do
      resources :messages, only: [:index, :new, :create]
      resources :reviews, only: [:index, :new, :create]
    end
  end

  get "dashboard", to: "dashboard#show"
  resources :bookings, only: [:show, :delete]
  resources :messages, only: [:show]
  resources :reviews, only: [:show, :delete]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
