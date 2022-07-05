Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  get 'password_resets/create'
  get 'password_resets/edit'
  get 'password_resets/update'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  root 'diaries#index'
  resources :diaries
  resources :users, only: %i[new create destroy] do
    member do
      get 'search'
    end
  end
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]

  resources :tags do
    get 'diaries', to: 'diaries#search'
  end
  get '/delete_account', to: 'profiles#delete'
  get '/terms', to: 'pages#terms'
  get '/privacy_policy', to: 'pages#privacy_policy'
  post 'like/:id', to: 'likes#create', as: 'create_like'
  post 'laugh/:id', to: 'laughs#create', as: 'create_laugh'
  post 'cry/:id', to: 'cries#create', as: 'create_cry'
  post 'surprise/:id', to: 'surprises#create', as: 'create_surprise'
  post 'paw/:id', to: 'paws#create', as: 'create_paw'
  get ':name', to: 'users#show'
end
