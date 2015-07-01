require 'json'

module TelegramApi::Controllers::Home
  class Update
    include TelegramApi::Action

    def call(params)
      begin
        message = params["message"]["text"]
        chat_id = params["message"]["chat"]["id"]
        LogCommand.process(message: message, chat_id: chat_id)
      rescue => e
        TelegramApi::Logger.error(e)
      end
      self.format = :json
      self.body = ""
    end
  end
end
