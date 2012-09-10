source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# gem 'sqlite3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# utility
gem "devise"
gem "omniauth"
gem "cancan"
# gem "RubyInline"

#ODM
gem 'mongoid', '~> 3.0.0'
gem 'mongoid-slugify'

# File and Image upload
gem "rmagick"
gem "carrierwave"
gem "carrierwave-mongoid",  :require => 'carrierwave/mongoid'

# view related
gem "jammit"
gem "simple_form"
gem "will_paginate"
gem "haml"
gem "haml-rails"
gem "bb-ruby", :git => "git://github.com/xinuc/bb-ruby.git", :ref => "99bedf9110a8a89b30d5098ad8f35cafd1417abc"
gem "googlecharts"

# searching
gem "sunspot_rails"
gem "sunspot_solr"

group :development, :test, :staging do
  gem "factory_girl_rails", "~> 3.1.0"
  gem 'pry-rails'
  gem 'pry-doc'
end

group :development do
  gem "guard", "~> 1.0.1"
  gem "guard-spork", "~> 0.6.1"
  gem "rake"
    
  # To use debugger
  #gem 'ruby-debug19', :require => 'ruby-debug'
end

group :test do
  gem "capybara", "~> 1.1.2"
  gem "cucumber-rails", "~> 1.3.0"
  gem "rspec-rails", "~> 2.9.0"
  gem "launchy", "~> 2.1.0"
  gem "email_spec", "~> 1.2.1"
  gem "spork-rails", "~> 3.2.0" # speed up loading rails env on test
  gem "database_cleaner"
end

group :staging, :production do
  gem "airbrake"
	gem "newrelic_rpm"
end


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
