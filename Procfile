web: rails s -p $PORT
worker: bundle exec sidekiq -c 5 -q critical -q default
webpacker: NODE_ENV=production ./bin/webpack-dev-server

