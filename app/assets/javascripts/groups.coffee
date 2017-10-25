# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this filec httpa//coffeescript.org/

$ ->
  iframeElement = document.querySelector('iframe')
  widget        = SC.Widget(iframeElement)
  Events        = SC.Widget.Events

  window.musync =
    updateGroup: (_.throttle (progress) ->
      widget.getCurrentSoundIndex (index) ->
        App.groupChannel.send
          index: index
          position: progress.currentPosition
    , 1000)

    updateClient: (data) ->
      widget.getCurrentSoundIndex (currentIndex) ->
        if currentIndex isnt data.index
          widget.skip(data.index)

      widget.getPosition (currentPosition) ->
        diff = Math.abs(currentPosition - data.position)
        tolerance = 200

        if diff >= tolerance
          widget.seekTo(data.position)

  if $('#owner').val() # cookies.signed[:user_id] is present
    widget.bind Events.READY, ->
      widget.bind Events.PLAY_PROGRESS, (progress) ->
        window.musync.updateGroup(progress)
