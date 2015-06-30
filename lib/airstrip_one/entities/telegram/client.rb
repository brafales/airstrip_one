require 'typhoeus'

module Telegram
  class Client

    TELEGRAM_API_ENDPOINT = "https://api.telegram.org/bot#{ENV['AUTH_TOKEN']}"

    def self.set_webhook(url:)
      connection.get(set_webhook_url, url: url)
    end

    def self.send_message(message, chat_id)
      puts Typhoeus.post(send_message_url, headers: {'Content-Type'=> "application/json"}, params: { chat_id: chat_id, text: message })
    end

    private

    def self.set_webhook_url
      "#{TELEGRAM_API_ENDPOINT}/setWebhook"
    end

    def self.send_message_url
      "#{TELEGRAM_API_ENDPOINT}/sendMessage"
    end
  end
end
