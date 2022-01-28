Rails.application.routes.draw do
  get 'profiles/show'
  get 'profiles/edit'
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
end
