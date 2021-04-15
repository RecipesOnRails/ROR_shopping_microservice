# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

ruby '2.5.3'
gem 'bundler'

# gem "rails"
gem 'sinatra'
gem 'figaro', git: 'https://github.com/bpaquet/figaro.git', branch: 'sinatra'
gem 'activerecord', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'faraday'

group :development do
   gem 'travis'
end

group :test do
  gem 'rspec-sinatra'
  gem 'capybara'
  gem 'launchy'
  gem 'simplecov'
  gem 'shoulda-matchers', '~> 4.0'
end
