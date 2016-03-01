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
Clone existing app
```
$ heroku git:clone -a myapp
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

#### Mailer
Declare job classes that can be run by queueing backends
```
gem 'activejob', '>= 4.2.5.1'
```
Sidekiq uses Redis to store all of its job and operational data
```
$ brew install redis
$ ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
$ redis-server
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
Loads environment variables from .env
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
    redirect_to authenticated_root_url, :alert => exception.message
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

`config/initializers/simple_form_bootstrap.rb`
```ruby
# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.error_notification_class = 'alert alert-danger'
  config.button_class = 'btn btn-default'
  config.boolean_label_class = nil

  config.wrappers :vertical_form, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: 'control-label'

    b.use :input, class: 'form-control'
    b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
  end

  config.wrappers :vertical_file_input, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :readonly
    b.use :label, class: 'control-label'

    b.use :input
    b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
  end

  config.wrappers :vertical_boolean, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :readonly

    b.wrapper tag: 'div', class: 'checkbox' do |ba|
      ba.use :label_input
    end

    b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
  end

  config.wrappers :vertical_radio_and_checkboxes, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: 'control-label'
    b.use :input
    b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
  end

  config.wrappers :horizontal_form, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: 'col-sm-2 control-label'

    b.wrapper tag: 'div', class: 'col-sm-10' do |ba|
      ba.use :input, class: 'form-control'
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :horizontal_file_input, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :readonly
    b.use :label, class: 'col-sm-2 control-label'

    b.wrapper tag: 'div', class: 'col-sm-10' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :horizontal_boolean, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :readonly

    b.wrapper tag: 'div', class: 'col-sm-offset-2 col-sm-10' do |wr|
      wr.wrapper tag: 'div', class: 'checkbox' do |ba|
        ba.use :label_input
      end

      wr.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      wr.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :horizontal_radio_and_checkboxes, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :readonly

    b.use :label, class: 'col-sm-2 control-label'

    b.wrapper tag: 'div', class: 'col-sm-10' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :inline_form, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: 'sr-only'

    b.use :input, class: 'form-control'
    b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
  end

  config.wrappers :multi_select, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: 'col-sm-2 control-label'
    b.wrapper tag: 'div', class: 'form-inline col-sm-10' do |ba|
      ba.use :input, class: 'form-control'
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end
  # Wrappers for forms and inputs using the Bootstrap toolkit.
  # Check the Bootstrap docs (http://getbootstrap.com)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :horizontal_form
  config.wrapper_mappings = {
    check_boxes: :horizontal_radio_and_checkboxes,
    radio_buttons: :horizontal_radio_and_checkboxes,
    file: :horizontal_file_input,
    boolean: :horizontal_boolean,
    datetime: :multi_select,
    date: :multi_select,
    time: :multi_select
  }
end

```

`/.travis.yml`
```yml
language: ruby
rvm:
  - '2.2.3'
addons:
  postgresql: '9.4'
services:
  - postgresql
before_script:
  - cp config/database.yml.travis config/database.yml
  - psql -c 'create database travis_ci_test;' -U postgres
```

`config/database.yml.travis`
```yml
test:
  adapter: postgresql
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
web: bundle exec rails s
web: bundle exec puma -C config/puma.rb
```

`/.gitignore`
```
/.bundle
/vendor/bundle
.env
```
