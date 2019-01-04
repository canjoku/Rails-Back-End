Rails.application.routes.draw do
  require 'sidekiq/web'
  post "/graphql", to: "graphql#execute"
  mount Sidekiq::Web => '/sidekiq'
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  root 'posts#index'
  get 'auth/oauth2/callback', to: 'auth0#callback'
  get 'auth/failure', to: 'auth0#failure'
  get 'logout', to: 'auth0#logout'
  get 'login', to: 'auth0#login'

  get 'about', to: 'pages#about'
  get 'projects', to: 'pages#projects'

  resources :subscribers, only: [:create]


  resources :posts, only: [:show, :index] do
    resources :comments, only: [:create]
  end

  namespace :admin do
    root 'posts#index'
    resources :posts do
      member do
        patch :publish
        patch :unpublish
      end
    end
    resources :subscribers, only: [:index]
  end
end