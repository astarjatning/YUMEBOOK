Rails.application.routes.draw do
  root 'top#top'
  resources :keywords, only: %i[index show] do
    collection do
      get 'search'
    end
  end
end
