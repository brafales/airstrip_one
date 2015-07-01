require 'telegram_bot_api'

TelegramBotApi.configure do |config|
  config.auth_token = ENV['AUTH_TOKEN']
end
