Rails.application.routes.draw do
  root 'pages#home'

  resources :posts
  get 'about' => 'pages#about', as: :about
  get 'contact' => 'pages#contact', as: :contact
  get 'signin' => 'pages#signin', as: :signin

  namespace :admin do
    resources :posts, :users
  end
end
