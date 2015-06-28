require 'json'

module TelegramApi::Controllers::Home
  class Update
    include TelegramApi::Action

    def call(params)
      TelegramApi::Logger.error params
      TelegramApi::Logger.error params["update_id"]
      self.format = :json
      self.body = ""
    end
  end
end
