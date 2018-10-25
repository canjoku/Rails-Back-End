web: rails s
worker: bundle exec sidekiq -c 5 -q critical -q default
webpacker: NODE_ENV=production ./bin/webpack-dev-server