Reactif::Application.routes.draw do

  resources :sessions,  only: [:new, :create, :destroy]
  resources :users,     only: [:new, :create]
  resources :reactions, only: [:new, :create, :show] do
    resources :taggings, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :tags,      only: [:index, :show]

  root to: 'pages#home'

  match '/g/:id',   to: 'reactions#serve'
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
end
