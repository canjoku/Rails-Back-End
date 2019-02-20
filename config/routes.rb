Rails.application.routes.draw do
  require 'sidekiq/web'
  post "/graphql", to: "graphql#execute"
  mount Sidekiq::Web => '/sidekiq'
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

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