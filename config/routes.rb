Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update, :index] do
    resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
  end
  resources :books, only: [:show, :edit, :create, :update, :index, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  root to: 'homes#top'
  get 'home/about', to: 'homes#about', as: 'about'
  get "/search", to: "searches#search"
end
