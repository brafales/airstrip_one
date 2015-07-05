class LogCommand
  def self.process(message:, chat_id:)
    if log_id = message.match(/\/log (\d+)/)
      message = self.by_log_id(log_id[1].to_i)
    elsif query_string = message.match(/\/search ([\w\s\.,-\?!]+)/)
      message = self.by_query_string(query_string[1])
    end
    if message
      TelegramApi::Logger.error(TelegramBotApi::Client.send_message(message, chat_id))
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
end
