Rails.application.routes.draw do
  root 'pages#home'

  resources :posts, only: [:index, :show]
  resources :users, except: [:destroy]
  get 'contact' => 'pages#contact', as: :contact

  namespace :admin do
    resources :posts
    resources :users, except: [:new, :show]
  end
end
