Reactif::Application.routes.draw do

  resources :sessions,       only: [:new, :create, :destroy]
  resources :users,          only: [:new, :create]

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
end
