App.helpchats = App.cable.subscriptions.create "HelpchatsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
   active_helpchat = $("[data-behavior='messages'][data-helpchat-id='#{data.helpchat_id}']")
    .append(data.message)
    # Called when there's incoming data on the websocket for this channel
