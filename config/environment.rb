require 'rubygems'
require 'bundler/setup'
require 'lotus/setup'
require_relative '../lib/airstrip_one'
require_relative '../apps/telegram_api/application'
require_relative '../apps/web/application'

Lotus::Container.configure do
  mount TelegramApi::Application, at: '/api'
  #mount Web::Application, at: '/'
end
