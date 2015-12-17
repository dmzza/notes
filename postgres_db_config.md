# new rails app with PostgreSQL db
'$ rails new appname -d postgresql'

# gemfile
```
ruby '2.2.3'
# Use Puma to run highly concurrent HTTP 1.1 server for Ruby/Rack applications
gem 'puma', '~> 2.15.3'
# Replaces the need for plugins, and ensures that Rails 4 is optimally configured for executing on Heroku.
gem 'rails_12factor'
```

# create `config/puma.rb`
```
workers Integer(ENV['WEB_CONCURRENCY'] || 4)
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  ActiveRecord::Base.establish_connection
end
```

# create `/Procfile`
`web: bundle exec puma -C config/puma.rb`
