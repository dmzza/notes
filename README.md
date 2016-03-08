## Rails 4 App creation, configuration, and description of gem use

#### Create new rails app with PostgreSQL db
`rails new AppNAME -d postgresql`

Disabled automatic stylesheet creation by adding these lines to `application.rb`
```ruby
config.generators.stylesheets = false
config.generators.javascripts = false
```
`$ rails g controller controller_name --no-assets`

##### Heroku
Create App
```
$ heroku create Appname
```
Associate a Git repo with an existing app
```
$ heroku git:remote -a Appname
```
Push local changes
```
$ git push heroku master
```
Adjusts the number of workers the main Puma process will fork, depending on dynos
```
$ heroku config:set SENSIBLE_DEFAULTS=enabled
```
Logs from Postgres
```
$ heroku logs -p postgres -t
```
Performs a number of health and diagnostic checks that help analyze and optimize the performance of a database
```
$ heroku pg:diagnose --app NAME
```
Establish a PostgreSQL interactive terminal(psql) session with remote db
```
$ heroku pg:psql
```

#### Gemfile
Ruby 2.2.3

Bundle edge Rails instead
```
gem 'rails', '>= 4.2.5'
```
Setup favicon icons
```
group :development do
  gem 'rails_real_favicon'
end
```
#### Testing
Testing framework for Rails 4.x
```
'gem 'rspec-rails', '>= 3.4', groups: [:development, :test]'
```
Initialize the spec/ directory (where specs will reside) with:
```
$ rails g rspec:install
```
In Rails 4, you may want to create a binstub for the rspec command so it can be run via bin/rspec:
```
$ bundle binstubs rspec-core
```
Add Wayne New Relic plan thru Heroku
```
gem 'newrelic_rpm'
```
[Download newrelic.yml](https://rpm.newrelic.com/accounts/1264255/applications/setup#)


#### Mailer
Declare job classes that can be run by queueing backends
```
gem 'activejob', '>= 4.2.5.1'
```
Sidekiq uses Redis to store all of its job and operational data
```
$ brew install redis
```
start Redis server `$ redis-server`
```
gem 'redis'
```
Asynchronous queueing system
```
gem 'sidekiq', '>= 3.2.5'
```
Sidekiq Web portal powered by Sinatra
```
gem 'sinatra', '>= 1.4.7'
```
Reset dashboard statistics `Sidekiq::Stats.new.reset`
#### Server
Use Puma to run highly concurrent HTTP 1.1 server for Ruby/Rack applications
```
gem 'puma', '>= 2.15.3'
```
Replaces the need for plugins, and ensures that Rails 4 is optimally configured for executing on Heroku
```
gem 'rails_12factor'
```
#### User Account System
Use Devise as authentication database
```
gem 'devise', '>= 3.5.6'
```
Run initializer which describes ALL of Devise's configuration options
```
$ rails g devise:install
```
Add Devise to any of your models using the generator
```
$ rails g devise MODEL
```
CanCanCan is an authorization library for Ruby on Rails
```
gem 'cancancan', '>= 1.10'
```
Run generator for creating Ability class
```
$ rails g cancan:ability
```
Allows mocking and stubbing of methods on real (non-mock) classes
```
gem 'mocha', '>= 1.1'
```
#### Simple Form
```
gem 'simple_form
```
Run the generator for SimpleForm Bootstrap integration:
```
$ rails g simple_form:install --bootstrap
```
This gem can help you work with Enum feather, I18n and simple_form
```
gem 'enum_help'
```
#### Database
Use Postgresql as the database for Active Record
```
gem 'pg', '>= 0.15'
```
Store environment variables in .env gitignored file
```
gem 'dotenv-rails', '>= 2.1.0'
```

------------
#### Config Files
`app/controllers/application_controller.rb`
```ruby
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  check_authorization unless: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to authenticated_root_url, alert: :'Login to continue'
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( :first_name, :last_name, :email, :password, :password_confirmation, :current_password, {:role_ids => []} )}
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit( :first_name, :last_name, :email, :password, :password_confirmation, :current_password, {:role_ids => []} )}
  end
end
```
`example controller`
```ruby
class ExampleController < ApplicationController
  load_and_authorize_resource
end
```

`config/puma.rb`
```ruby
workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
    # @sidekiq_pid ||= spawn("bundle exec sidekiq -C config/sidekiq.rb -c 3 -q critical -q default -q low")
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  ActiveRecord::Base.establish_connection
end
```

`config/sidekiq.rb`
```ruby
Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDISCLOUD_URL'], size: 6 }
end

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDISCLOUD_URL'], size: 16 }
end
```

`config/application.rb`
```ruby
GC::Profiler.enable #New Relic Ruby agent that collects information about how much time is spent in garbage collection
# Do not swallow errors in after_commit/after_rollback callbacks.
config.active_record.raise_in_transactional_callbacks = true
config.active_job.queue_adapter = :sidekiq
```

`config/environments/development.rb`
```ruby
Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Default host used by Mailer
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }

  config.action_mailer.perform_deliveries = true

  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
  address: 'smtp.gmail.com',
  port: 587,
  domain: ENV['GMAIL_DOMAIN'],
  authentication: 'plain',
  enable_starttls_auto: true,
  user_name: ENV['GMAIL_USERNAME'],
  password: ENV['GMAIL_PASSWORD']
  }

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
end
```

`config/environments/production.rb`
```ruby
Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
  Rails.application.routes.default_url_options[:host] = 'sbe.herokuapp.com'
  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Mailer enabled for Devise.
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default :charset => "utf-8"

  config.action_mailer.smtp_settings = {
  address: 'smtp.gmail.com',
  port: 587,
  domain: ENV['GMAIL_DOMAIN'],
  authentication: 'plain',
  enable_starttls_auto: true,
  user_name: ENV['GMAIL_USERNAME'],
  password: ENV['GMAIL_PASSWORD']
  }

  config.action_mailer.default_url_options = { :host => 'sbe.herokuapp.com' }

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = :uglifier
  config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true
  config.log_level = :debug

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false
end
```

`config/environments/test.rb`
```ruby
# Default host used by Mailer
config.action_mailer.default_url_options = { :host => 'localhost:3000' }
```

`config/database.yml`
```yml
default: &default
  adapter: postgresql
  encoding: unicode
  pool: 5
  username: david
  host: localhost

development:
  <<: *default
  database: app_development

test:
  <<: *default
  database: app_test

production:
  <<: *default
  database: app_production
  password: <%= ENV['APP_DATABASE_PASSWORD'] %>
  url: <%= ENV['DATABASE_URL'] %>
```


`/.travis.yml`
```yml
language: ruby
rvm:
  - '2.2.3'
addons:
  postgresql: '9.3'
services:
  - redis-server
before_script:
  - cp config/database.yml.travis config/database.yml
  - psql -c 'create database travis_ci_test;' -U postgres
```

`config/database.yml.travis`
```yml
test:
  adapter: postgresql
  encoding: unicode
  pool: 5
  host: localhost
  database: travis_ci_test
  username: postgres
```

`spec/rails_helper.rb`
```ruby
require 'spec_helper'
require 'rspec/rails'
# note: require 'devise' after require 'rspec/rails'
require 'devise'

RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
end
```

`/Procfile`
```
web: bundle exec rails server Puma -p $PORT
worker: bundle exec sidekiq -c 12 -q critical -q default -q low -C config/sidekiq.rb
```

`/.gitignore`
```
/.bundle
/vendor/bundle
.env
```
