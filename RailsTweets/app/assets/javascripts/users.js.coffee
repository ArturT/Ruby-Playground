# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# http://stackoverflow.com/a/9254330
# namespace User
window.User = {}

# function can be called only once at the same time
refresh_tweets_static_lock = false; 
window.User.refresh_tweets = (id_element, id_user, limit_tweets = null) ->  
  if refresh_tweets_static_lock == false    
    refresh_tweets_static_lock = true;
    toggle_html(id_element, 'loading...');
    
    str = '' 
    if(!isNaN(limit_tweets) && limit_tweets > 0)    
        str = '/'+limit_tweets
      
    $.ajax({
      url: '/users/'+id_user+'/tweets'+str,
      success: (data) ->
        toggle_html(id_element, data);
        setTimeout(() -> 
          refresh_tweets_static_lock = false
        ,600) # 600ms is time of animation for arg "slow" in jquery.animate
    });
  

