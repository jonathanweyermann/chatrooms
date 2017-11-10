App.queue = App.cable.subscriptions.create "QueueChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    active_helpchat = $("[data-behavior='queue_number'][data-customer-id='#{data.customer_id}']")
    if (data.message>0)
      $(active_helpchat).html(data.message)
    else
      $(active_helpchat).html("You are first in line. An agent should be with you shortly")
    other_party_left = $("[data-behavior='other_party_left'][data-helpchat-id='#{data.helpchat_id}']")
    $(other_party_left).html("The Agent has abandoned the Chatroom")

  update_count: ->
    @perform 'update_count'
