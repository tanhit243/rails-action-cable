# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise'
gem 'dotenv-rails'
gem 'jbuilder', '~> 2.7'
gem 'mysql2'
gem 'omniauth-facebook'
gem 'omniauth-rails_csrf_protection'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.1'
gem 'redis', '~> 4.0'
gem 'sass-rails', '>= 6'
gem 'sprockets-rails'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-rails'
  gem 'rubocop', '~> 1.22', require: false
end

group :production do
  gem 'capistrano', '~> 3.10', require: false
  gem 'capistrano3-puma'
  gem 'capistrano-bundler', '~> 2.0', require: false
  gem 'capistrano-rails', '~> 1.6', require: false
  gem 'capistrano-rbenv', '~> 2.2'
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
