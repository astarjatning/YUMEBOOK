Rails.application.routes.draw do
  root 'top#top'
  resources :keywords, only: %i[index show]
end
