Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: "pages#homepage", as: :user_root
  end

  unauthenticated :user do
    devise_scope :user do
      root to: "devise/sessions#new"
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

  resources :communications, only: [ :index, :show, :new, :create, :destroy ]

  resources :tickets do
    resources :actions, only: [ :create ]
    resources :comments, only: [:new, :create]
  end

  patch 'tickets/update_status/:id', to: 'actions#update_status', as: 'update_status'

  resources :actions, only: [ :index, :edit, :update, :destroy ]
  resources :comments, only: [:destroy]

  get "/home", to: "pages#homepage", as: 'home'
  get "/menu", to: "pages#home", as: "menu"
end
