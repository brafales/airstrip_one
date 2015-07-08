module MessageProcessors
  class SingleLog

    def initialize(message)
      @message = message
    end

    def interested?
      @message.text.match(/^\/log (\d+)$/)
    end

    def process
      log_id = @message.text.match(/^\/log (\d+)$/)[1]
      begin
        log = Pinchito::Log.from_id(log_id)
        TelegramBotApi::Client.send_message(log.to_s, @message.chat["id"])
      rescue Pinchito::LogNotFound
        TelegramBotApi::Client.send_message(%Q(El log #{log_id} no existeix), @message.chat["id"])
      end
    end
  end
end
