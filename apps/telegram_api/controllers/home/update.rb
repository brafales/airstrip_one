require 'json'

module TelegramApi::Controllers::Home
  class Update
    include TelegramApi::Action

    def call(params)
      begin
        message = TelegramBotApi::Message.new(params["message"])
        MessageDispatcher.process(message)
      rescue => e
        TelegramApi::Logger.error(e)
      end
      self.format = :json
      self.body = ""
    end
  end
end
