Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :storehouses, only: [:index]
  end
  namespace :admin do
    resources :reservations, only: [:index] do
      member do
        get "accept", to: "reservations#accept"
        get "decline", to: "reservations#decline"
      end
    end
  end
  resources :reservations, only: [:destroy]
  resources :storehouses do
    resources :reservations
  end
  get 'about_us', to: 'pages#about_us'
  get 'legal_mention', to: 'pages#legal_mention'
end
