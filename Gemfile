# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.4.12'

gem 'rails', '~> 8.1.4'

gem 'pg', '~> 1.6'
gem 'puma', '>= 6.0'

gem 'bootsnap', require: false
gem 'rack-cors'
gem 'tzinfo-data', platforms: %i[windows jruby]

# Authentication: Devise issues the session, devise-jwt turns it into a bearer
# token, jsonapi-serializer renders the responses.
gem 'devise'
gem 'devise-jwt'
gem 'jsonapi-serializer'

group :development, :test do
  gem 'debug', platforms: %i[mri windows]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails', '~> 8.0'
end

group :development do
  gem 'rubocop', require: false
  gem 'rubocop-factory_bot', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubocop-rspec_rails', require: false
end

group :test do
  gem 'jsonapi-rspec'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers'
end
