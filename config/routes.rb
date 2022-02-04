Rails.application.routes.draw do
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  
  root 'top#top'
  resources :diaries
  resources :users, only: %i[new create]
  resource :profile, only: %i[show edit update]
  resources :keywords, only: %i[index show] do
    collection do
      get 'search'
    end
  end
  get ':name', to: 'users#show'
  post 'like/:id', to: 'likes#create', as: 'create_like'
  delete 'like/:id', to: 'likes#destroy', as: 'destroy_like'
  post 'laugh/:id', to: 'laughs#create', as: 'create_laugh'
  delete 'laugh/:id', to: 'laughs#destroy', as: 'destroy_laugh'
  post 'cry/:id', to: 'cries#create', as: 'create_cry'
  delete 'cry/:id', to: 'cries#destroy', as: 'destroy_cry'
end
