Rails.application.routes.draw do
  get 'species/index'
  get 'species/show'
  get 'planets/index'
  get 'planets/show'
  get 'people/index'
  get 'people/show'
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
