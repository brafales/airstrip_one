ruby '2.2.2'
source 'https://rubygems.org'

gem 'bundler'
gem 'rake'

gem 'lotusrb',       '0.4.0'
gem 'lotus-model',   '~> 0.4'
gem 'lotus-router', git: 'https://github.com/AlfonsoUceda/router.git', branch: 'fix-container-router-bug'

gem 'pinchito', git: 'https://github.com/brafales/pinchito.git'

gem 'faraday'
gem 'pg'
gem 'nokogiri'

group :test do
  gem 'minitest'
  gem 'capybara'
end

group :test, :development do
  gem 'byebug'
end

group :production do
  gem 'puma'
end
