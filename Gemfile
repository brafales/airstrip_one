ruby '2.3.0'
source 'https://rubygems.org'

gem 'bundler'
gem 'rake'

gem 'lotusrb',          '0.4.0'
gem 'lotus-model',      '~> 0.4'
gem 'lotus-router',     git: 'https://github.com/AlfonsoUceda/router.git', branch: 'fix-container-router-bug'

gem 'pinchito',         git: 'https://github.com/brafales/pinchito.git', ref: '88ecce87355aa24b427af3b298b9f054613db82e'
gem 'telegram_bot_api', git: 'https://github.com/brafales/telegram_bot_api.git'

gem 'typhoeus'
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
