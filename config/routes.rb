Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :items do
    resources :bookings, only: [:index, :show, :new, :create, :delete] do
      resources :messages, only: [:index, :show, :new, :create]
      resources :reviews, only: [:index, :show, :new, :create, :delete]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
