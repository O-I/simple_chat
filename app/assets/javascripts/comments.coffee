window.client = new Faye.Client('/faye')

client.addExtension {
  outgoing: (message, callback) ->
    message.ext = message.ext || {}
    message.ext.csrfToken = $('meta[name=csrf-token]').attr('content')
    callback(message)
}

client.subscribe '/comments', (payload) ->
  $('#comments').find('.media-list').prepend(payload.message) if payload.message

jQuery ->
  $('#new_comment').submit ->
    $(this).find("input[type='submit']").val('Sending...').prop('disabled', true)