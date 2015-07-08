module MessageProcessors
  class SingleLog

    def initialize(message)
      @message = message
    end

    def interested?
      @message.match(/^\/log (\d+)$/)
    end

    def process
      log_id = message.match(/^\/log (\d+)$/)[1]
      log = Pinchito::Log.from_id(log_id)
      TelegramBotApi::Client.send_message(log.to_s, @message.chat["id"])
    end
  end
end
