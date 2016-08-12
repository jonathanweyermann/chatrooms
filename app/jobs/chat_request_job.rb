class ChatRequestJob < ApplicationJob
  queue_as :default

  def perform(helpchat)
    ActionCable.server.broadcast "chat_request", {
      message: Operators::HelpchatsController.render(partial: "chat_link.html", locals: { helpchats: Helpchat.in_queue }),
      detailed_message: Operators::HelpchatsController.render(partial: "helpchat.html", locals: { helpchats: Helpchat.in_queue })
    }
  end
end
