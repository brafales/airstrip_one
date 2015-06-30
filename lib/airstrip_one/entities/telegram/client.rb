module Telegram
  class Client

    TELEGRAM_API_ENDPOINT = "https://api.telegram.org/"

    def self.set_webhook(url:)
      connection.get(set_webhook_url, url: url)
    end

    def self.send_message(message, chat_id)
      connection.post(send_message_url, chat_id: chat_id, text: message)
    end

    private

    def self.set_webhook_url
      "#{bot_url}/setWebhook"
    end

    def self.send_message_url
      "#{bot_url}/sendMessage"
    end

    def self.bot_url
      bot = ENV["bot"]
      auth_token = ENV["auth_token"]
      "#{bot}#{auth_token}"
    end

    def self.connection
      Faraday.new(:url => TELEGRAM_API_ENDPOINT) do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end
  end
end
