App.chat_request = App.cable.subscriptions.create "ChatRequestChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    chat_request = $("[data-behavior='chat-request']")
    chat_request_two = $("[data-behavior='chat-request-two']")
    if data.message==""
      $(chat_request).html("There are no chat requests in queue")
      $(chat_request_two).html("There are no chat requests in queue")
    else
      $(chat_request).html(data.message)
      $(chat_request_two).html(data.detailed_message)
    # Called when there's incoming data on the websocket for this channel
