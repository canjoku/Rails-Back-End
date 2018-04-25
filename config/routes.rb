Rails.application.routes.draw do
  root 'pages#home'

  resources :posts, only: [:index, :show]
  resources :users, only: [:new, :show, :create]
  get 'about' => 'pages#about', as: :about
  get 'contact' => 'pages#contact', as: :contact

  namespace :admin do
    resources :posts
    resources :users, exept: [:new, :show]
  end
end
