class LogCommand
  def self.process(message:, chat_id:)
    log_id = message.match(/log (\d+)/)[1].to_i
    if log_id > 0
      pinchito_log = Pinchito::Log.from_id(log_id)
      TelegramApi::Logger.error(TelegramBotApi::Client.send_message(pinchito_log.to_s, chat_id))
    end
  end
end
