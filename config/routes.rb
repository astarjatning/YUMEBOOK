Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  get 'password_resets/create'
  get 'password_resets/edit'
  get 'password_resets/update'
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
  resources :password_resets, only: %i[new create edit update]

  get ':name', to: 'users#show'

  post 'like/:id', to: 'likes#create', as: 'create_like'
  delete 'like/:id', to: 'likes#destroy', as: 'destroy_like'

  post 'laugh/:id', to: 'laughs#create', as: 'create_laugh'
  delete 'laugh/:id', to: 'laughs#destroy', as: 'destroy_laugh'

  post 'cry/:id', to: 'cries#create', as: 'create_cry'
  delete 'cry/:id', to: 'cries#destroy', as: 'destroy_cry'

  post 'surprise/:id', to: 'surprises#create', as: 'create_surprise'
  delete 'surprise/:id', to: 'surprises#destroy', as: 'destroy_surprise'

  post 'paw/:id', to: 'paws#create', as: 'create_paw'
  delete 'paw/:id', to: 'paws#destroy', as: 'destroy_paw'
end
