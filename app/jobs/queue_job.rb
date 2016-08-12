class QueueJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "queue_count:#{message[:customer_id]}", {
      message: message[:count],
      customer_id: message[:customer_id],
      helpchat_id: message[:helpchat_id]
    }
  end
end
