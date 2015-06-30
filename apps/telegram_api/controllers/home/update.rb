require 'json'

module TelegramApi::Controllers::Home
  class Update
    include TelegramApi::Action

    def call(params)
      TelegramApi::Logger.error params
      Telegram::Client.send_message("Logs casolans fets a foc lent", params["message"]["chat"]["id"])
      self.format = :json
      self.body = ""
    end
  end
end
