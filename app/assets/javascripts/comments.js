// Generated by CoffeeScript 1.6.3
window.client = new Faye.Client('/faye');

jQuery(function() {
  return client.subscribe('/comments', function(payload) {
    if (payload.message) {
      return $('#comments').find('.media-list').prepend(payload.message);
    }
  });
});
