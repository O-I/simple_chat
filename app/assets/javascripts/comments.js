// Generated by CoffeeScript 1.6.3
window.client = new Faye.Client('/faye');

client.subscribe('/comments', function(payload) {
  if (payload.message) {
    return $('#comments').find('.media-list').prepend(payload.message);
  }
});

jQuery(function() {
  return $('#new_comment').submit(function() {
    return $(this).find("input[type='submit']").val('Sending...').prop('disabled', true);
  });
});
