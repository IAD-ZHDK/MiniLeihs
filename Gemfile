source 'https://rubygems.org'
ruby '2.6.7'

gem 'rails', '6.1.3.2'

gem 'sass-rails'
gem 'uglifier'
gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'

source 'https://rails-assets.org' do
  gem 'rails-assets-normalize-css'
end

gem 'jbuilder'
gem 'mongoid'
gem 'email_validator'

gem 'sinatra', :require => nil
gem 'sidekiq', '~> 5.2.8' # compatible with redis 3
gem 'sidekiq-cron'

gem 'slim'
gem 'formtastic'

group :development, :test do
  gem 'byebug'
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console'
  gem 'spring'
  gem 'letter_opener'
end

group :production do
  gem 'puma'
end
