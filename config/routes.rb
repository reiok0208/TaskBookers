Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#new'
  get 'home/about'

  get 'users' => 'users#index', as: 'users_index'

  get 'users/:id' => 'users#show', as: 'users_show'

  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:create, :edit, :update]
end
