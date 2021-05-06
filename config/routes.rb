Rails.application.routes.draw do
  resources :people, only: %i[index show]
  resources :planets, only: %i[index show]
  resources :species, only: %i[index show]
  resources :starships, only: %i[index show]
  root to: 'people#index'
end
