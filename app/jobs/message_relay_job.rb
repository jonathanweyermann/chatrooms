class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "helpchat:#{message.helpchat_id}", {
      message: MessagesController.render(message.decorate),
      helpchat_id: message.helpchat_id
    }
  end
end
