class LogCommand
  def self.process(message:, chat_id:)
    message_to_send = nil
    if log_id = message.match(/\/log (\d+)/)
      message_to_send = self.by_log_id(log_id[1].to_i)
    elsif query_string = message.match(/\/search ([\w\s\.,-\?!]+)/)
      message_to_send = self.by_query_string(query_string[1])
    elsif message.match(/^\/tapeta$/)
      message_to_send = self.tapeta
    end
    if message_to_send
      TelegramApi::Logger.error(TelegramBotApi::Client.send_message(message_to_send, chat_id))
    end
  end

  private

  def self.by_log_id(log_id)
    if log_id > 0
      Pinchito::Log.from_id(log_id)
    end
  end

  def self.by_query_string(query_string)
    Pinchito::Log.from_search(query_string)
  end

  def self.tapeta
    Pinchito::Log.from_tapeta
  end
end
