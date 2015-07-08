module MessageProcessors
  class Tapeta

    def initialize(message)
      @message = message
    end

    def interested?
      @message.text.match(/^\/tapeta$/)
    end

    def process
      log = Pinchito::Log.from_tapeta
      TelegramBotApi::Client.send_message(log.to_s, @message.chat["id"])
    end
  end
end
