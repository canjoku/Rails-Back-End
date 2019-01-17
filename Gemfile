source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.1'

gem 'puma', '~> 3.12'


gem 'rails', '~> 5.2', '>= 5.2.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap', '~> 4.1', '>= 4.1.3'
gem 'sprockets-rails', '~> 3.0', '>= 3.0.4'
gem 'uglifier', '>= 1.3.0'
gem 'omniauth-auth0', '~> 2.0'
gem 'omniauth', '~> 1.8', '>= 1.8.1'
# gem 'therubyracer', platforms: :ruby

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
# gem 'redis', '~> 4.0'
gem 'bcrypt', '~> 3.1.7'
gem 'will_paginate', '~> 3.1.1'
gem 'will_paginate-bootstrap4', '~> 0.2.2'
gem 'coderay', '~> 1.1', '>= 1.1.2'
gem 'wisper-rspec', '~> 1.1', require: false

gem 'webpacker', '~> 3.5', '>= 3.5.5'

# gem 'capistrano-rails', group: :development
gem 'dotenv-rails', '~> 2.1', '>= 2.1.1'
gem 'sidekiq', '~> 4.1', '>= 4.1.2'
gem 'sinatra', github: 'sinatra/sinatra'

gem 'wisper', '~> 1.6', '>= 1.6.1'
gem 'redcarpet', '~> 3.4'
gem 'rouge', '~> 3.3'

gem 'dalli', '~> 2.7', '>= 2.7.8'
gem 'graphql', '~> 1.8', '>= 1.8.6'

group :development, :test do
  gem 'byebug', '~> 10.0', '>= 10.0.1', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
  gem 'faker', '~> 1.6', '>= 1.6.6'
  gem "database_cleaner"
end

group :test do
  gem 'selenium-webdriver', '~> 3.14'
  gem 'capybara', '~> 3.5', '>= 3.5.1'
  gem 'chromedriver-helper', '~> 1.2'
  gem 'rspec-sidekiq', '~> 3.0', '>= 3.0.3'

end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring', '~> 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'foreman', '~> 0.85.0'
end

gem 'tzinfo-data', '~> 1.2018', '>= 1.2018.4', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'graphiql-rails', '1.4.4', group: :development
gem 'friendly_id', '~> 5.2', '>= 5.2.4'
gem 'mini_racer', '~> 0.2.0'
gem 'gibbon', '~> 3.2'
gem "aws-sdk-s3", require: false
gem 'certified', '~> 1.0'
gem 'image_processing', '~> 1.7', '>= 1.7.1'
gem 'mini_magick', '~> 4.9', '>= 4.9.2'
gem 'bundler', '~> 1.11', '>= 1.11.2'
gem 'rack-cors', '~> 1.0', '>= 1.0.2', require: 'rack/cors'