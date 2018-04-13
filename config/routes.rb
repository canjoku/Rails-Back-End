Rails.application.routes.draw do

  root to: 'blog/posts#index'

  scope module: 'blog' do 
    get 'contact/new'
    get 'contact/create'
    get 'about/index'
    get 'categories/show'
    get 'comments/new'
    get 'posts/index'
    get 'posts/show'
  end

  namespace :admin do
    resources :posts, :users, :categories, :comments
  end

end
