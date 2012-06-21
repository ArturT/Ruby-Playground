# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# http://stackoverflow.com/a/9254330
# namespace User
window.User = {}

window.User.refresh_tweets = (id_element, id_user) ->
  toggle_html(id_element, 'loading...');
    
  $.ajax({
    url: '/users/'+id_user+'/tweets',
    success: (data) ->
      toggle_html(id_element, data);
  });