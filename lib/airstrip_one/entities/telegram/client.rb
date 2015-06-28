module Telegram
  class Client

    TELEGRAM_API_ENDPOINT = "https://api.telegram.org/"

    def self.set_webhook(url)
      connection.get set_webhook_url url: "https://airstrip-one.herokuapp.com/api/update"
    end

    private

    def self.set_webhook_url
      "#{bot_url}/setWebhook"
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
