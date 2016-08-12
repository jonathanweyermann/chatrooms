class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "chatroom:#{message.chatroom_id}", {
      message: MessagesController.render(message),
      chatroom_id: message.chatroom_id
    }
  end
end
