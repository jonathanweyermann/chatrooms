# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class HelpchatsChannel < ApplicationCable::Channel
  def subscribed
    current_customer.helpchats.each do | helpchat |
      stream_from "helpchat:#{helpchat.id}"
    end
  end

  def unsubscribed
    stop_all_streams
  end
end
