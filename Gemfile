source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'pg', '~> 1.1'
gem 'rails', '~> 7.0.8'
gem 'sprockets-rails'

gem 'importmap-rails'
gem 'jsbundling-rails'
gem 'puma', '~> 5.0'
gem 'stimulus-rails'
gem 'turbo-rails'

gem 'cssbundling-rails'
gem 'jbuilder'
gem 'redis', '~> 4.0'

gem 'bootsnap', require: false
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'rack-attack'
gem 'rack-cors'

gem 'config'
gem 'discard'
gem 'email_validator'

gem 'dotenv-rails' # used in stg
gem 'paper_trail'

gem 'devise'
gem 'devise-i18n'
gem 'devise_invitable'
gem 'pundit'

gem 'cells-erb'
gem 'cells-rails'
gem 'gretel'
gem 'kaminari'
gem 'meta-tags'
gem 'sitemap_generator'
gem 'slack-notifier'

gem 'fastimage'
gem 'image_processing'
gem 'redcarpet'
gem 'rubyzip', require: false
gem 'shrine'

gem 'counter_culture'

gem 'simple_form'
gem 'tailwindcss-rails', '~> 2.0'

group :development, :test do
  # for sample data
  gem 'faker'
  gem 'forgery_ja'
  gem 'gimei'

  # Code Analyze
  gem 'brakeman', require: false
  gem 'bullet'
  gem 'erb_lint'
  gem 'htmlbeautifier'
  gem 'rails_best_practices', require: false
  gem 'rubocop'

  # Debugger
  gem 'better_errors'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'rspec_junit_formatter'

  # tests
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'simplecov'

  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'letter_opener_web'
  gem 'rails-erd'
end

group :development do
  gem 'web-console'

  gem 'activerecord-import'
  gem 'rack-mini-profiler'
end
