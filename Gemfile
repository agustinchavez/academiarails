source 'http://rubygems.org'
ruby "2.7.0"
gem 'rails', '~> 4.2.3'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end
gem 'jquery-rails'
gem "rspec-rails", :group => [:development, :test]
gem "database_cleaner", :group => :test
gem "email_spec", :group => :test
gem "cucumber-rails", :group => :test
gem "launchy", :group => :test
gem "capybara", :group => :test
gem "factory_bot_rails", :group => [:development, :test]
# gem "teaspoon", :group => [:development, :test]
gem "bootstrap-sass"
gem "devise"
gem "cancan"
gem "rolify"
gem "simple_form"
gem "stripe"
gem "stripe_event"
gem 'nokogiri'
gem "quiet_assets", :group => :development
gem "figaro"
gem "better_errors", :group => :development
gem "binding_of_caller", :group => :development, :platforms => [:mri_19, :rbx]

gem 'sidekiq'
gem 'sprockets-rails', ">= 3.0.4"

gem 'protected_attributes'

gem 'rename'

gem 'bootstrap', '~> 4.3.1'
gem 'friendly_id', '~> 5.1.0' # Note: You MUST use 5.0.0 or greater for Rails 4.0+

gem 'annotate'

gem 'turbolinks'

gem 'will_paginate', '~> 3.1.0'
gem 'acts-as-taggable-on', '~> 4.0'

gem 'bigdecimal', '1.4.2'

group :development, :test do
  gem 'sqlite3', '~> 1.3.0'
end

group :production do
  gem 'pg', '~> 0.18'
  gem 'rails_12factor'
end
