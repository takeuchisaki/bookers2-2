Rails.application.routes.draw do
  get 'chats/show'
  devise_for :users
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
  root to: "homes#top"
  get "home/about" => "homes#about", as: "about"
  resources :books, only: [:show, :edit, :index, :destroy, :create, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :index, :update] do
    resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
  end
  get "search" => "searches#search"
  
  get 'chat/:id', to: 'chats#show', as: 'chat'
  resources :chats, only: [:create]
  resources :groups do
    get "join" => "groups#join"
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
