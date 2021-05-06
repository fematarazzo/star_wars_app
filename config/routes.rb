Rails.application.routes.draw do
  resources :people, only: %i[index show]
  resources :planets, only: %i[index show]
  resources :species, only: %i[index show]
  resources :starships, only: %i[index show]
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
