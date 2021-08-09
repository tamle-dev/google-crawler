source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2', '>= 5.2.2.1'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

gem 'psych', '~> 3.1.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails', '~> 0.3.9'

  # testing framework
  gem 'rspec-rails', '~> 3.8', '>= 3.8.2'

  # help to kill N+1 queries and unused eager loading.
  gem 'bullet', '~> 5.9'

  # Generate test data
  gem 'factory_bot_rails', '~> 5.0', '>= 5.0.1'

  # Guard::RSpec automatically run your specs (much like autotest)
  gem 'guard', '~> 2.15'
  gem 'guard-rspec', '~> 4.7', '>= 4.7.3'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # A Ruby static code analyzer, based on the community Ruby style guide.
  gem 'rubocop', '~> 0.66.0'

  # A code metric tool to check the quality of Rails code.
  gem 'rails_best_practices', '~> 1.19', '>= 1.19.4'

  # Better error page for Rack apps
  gem 'better_errors', '~> 2.5', '>= 2.5.1'
  gem 'binding_of_caller', '~> 0.8.0'

  # Allows to automatically reload your browser when 'view' files are modified.
  gem 'guard-livereload', '~> 2.5', '>= 2.5.2'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'

  # Clean our test database to ensure a clean state in each test suite
  gem 'database_cleaner', '~> 1.7'

  # gem 'spring-commands-rspec', '~> 1.0', '>= 1.0.4'
  gem 'webmock', '~> 3.5', '>= 3.5.1'
  gem 'timecop', '~> 0.9.1'

  # Generate test coverage
  gem 'simplecov', '~> 0.16.1'

  # Modify ENV
  gem 'climate_control', '~> 0.2.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# A Ruby gem to load environment variables from `.env`
gem 'dotenv-rails', '~> 2.7', '>= 2.7.1'

# Parse json
gem 'oj', '~> 3.7', '>= 3.7.11'

# Model helpers
gem 'enumerize', '~> 2.2', '>= 2.2.2'
gem 'file_validators', '~> 2.3'
gem 'countries', '~> 2.1', '>= 2.1.4'
gem 'liquid', '~> 4.0', '>= 4.0.3'
gem 'sanitize', '~> 5.0'
gem 'activerecord-import', '~> 1.0', '>= 1.0.2'
gem 'bcrypt-ruby', '~> 3.1', '>= 3.1.5'
gem 'composite_primary_keys', '~> 11.2'
gem 'ransack', '~> 2.3', '>= 2.3.2'

# Background jobs
gem 'redis-namespace', '~> 1.6'
gem 'redis-rails', '~> 5.0', '>= 5.0.2'

gem 'sidekiq', '~> 5.2', '>= 5.2.5'
gem 'sidekiq-cron', '~> 1.1'
gem 'sidekiq_alive', '~> 2.0', '>= 2.0.1'
gem 'sinatra', git: 'git://github.com/hoahm/sinatra.git', require: nil

# DB
gem 'pg', '~> 1.1', '>= 1.1.4'

# Authentication
gem 'jwt'
gem 'devise', '~> 4.6', '>= 4.6.2'

# Upload file
gem 'carrierwave', '~> 1.3', '>= 1.3.1'
gem 'fog', '~> 2.1'
gem 'fog-google', '~> 1.9'

group :development, :production do
  gem 'newrelic_rpm', '~> 6.2', '>= 6.2.0.354'
end

# Debug tools
gem 'iconsole', git: 'https://github.com/dtthaison/iconsole.git'

# CORS
gem 'rack-cors', '~> 1.0', '>= 1.0.3'

# View helpers
gem 'slim-rails', '~> 3.2'
gem 'jquery-rails', '~> 4.3', '>= 4.3.5'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.5'
gem 'select2-rails', '~> 4.0', '>= 4.0.3'
gem 'bootstrap4-kaminari-views', '~> 1.0', '>= 1.0.1'
gem 'twitter-bootstrap-rails', '~> 4.0'
gem 'simple_form', '~> 5.0', '>= 5.0.1'
gem 'nested_form_fields', '~> 0.8.2'
gem 'nested_form', '~> 0.3.2'
gem 'momentjs-rails', '~> 2.20', '>= 2.20.1'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17', '>= 4.17.47'
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'
gem 'gretel', '~> 3.0', '>= 3.0.9' # Breadcrumb
gem 'kaminari', '~> 1.1', '>= 1.1.1' # paging

# Controller helpers
gem 'responders', '~> 3.0'

#
gem 'rails-i18n', '~> 5.1.3'