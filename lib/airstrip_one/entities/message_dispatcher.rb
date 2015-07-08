class MessageDispatcher
  def self.process(message)
    processors.each do |processor|
      processor_instance = processor.new(message)
      if processor_instance.interested?
        processor_instance.process
      end
    end
  end
end
