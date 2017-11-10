# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class QueueChannel < ApplicationCable::Channel
  def subscribed
    stream_from "queue_count:#{current_customer.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def update_count
  end
end
