module MessageProcessors
  class SearchLog

    def initialize(message)
      @message = message
    end

    def interested?
      @message..text.match(/^\/search ([\w\s\.,-\?!]+)$/)
    end

    def process
      query_string = @message.text.match(/\/search ([\w\s\.,-\?!]+)/)[1]
      log = Pinchito::Log.from_search(query_string)
      TelegramBotApi::Client.send_message(log.to_s, @message.chat["id"])
    end
  end
end
