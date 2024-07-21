Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update, :index]
  resources :books, only: [:show, :edit, :create, :update, :index, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  root to: 'homes#top'
  get 'home/about', to: 'homes#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
