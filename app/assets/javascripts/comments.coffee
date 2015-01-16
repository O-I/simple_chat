source = new EventSource('/comments')

source.onmessage = (event) ->
  console.log event.data

jQuery ->
  $('#new_comment').submit ->
    $(this).find("input[type='submit']").val('Sending...').prop('disabled', true)