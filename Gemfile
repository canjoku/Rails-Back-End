source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap', '~> 4.1.0'
gem 'sprockets-rails', '~> 3.0', '>= 3.0.4'
gem 'uglifier', '>= 1.3.0'
# gem 'therubyracer', platforms: :ruby

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
# gem 'redis', '~> 4.0'
gem 'bcrypt', '~> 3.1.7'
gem 'will_paginate', '~> 3.1.1'
gem 'will_paginate-bootstrap4', '~> 0.2.2'

# gem 'capistrano-rails', group: :development
gem 'dotenv-rails'

group :development, :test do
  gem 'byebug', '~> 10.0', '>= 10.0.1', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.7'
  gem 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
  gem 'faker', '~> 1.6', '>= 1.6.6'
end

group :test do
  gem 'capybara', '~> 2.7', '>= 2.7.1'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring', '~> 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', '~> 1.2018', '>= 1.2018.4', platforms: [:mingw, :mswin, :x64_mingw, :jruby]