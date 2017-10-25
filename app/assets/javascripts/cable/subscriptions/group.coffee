match = location.pathname.match(/\/(\d+)/)
id    = match?[1]

if id
  App.groupChannel = App.cable.subscriptions.create { channel: 'GroupChannel', id: id },
    received: (data) ->
      window.musync.updateClient(data)
