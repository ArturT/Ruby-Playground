module UsersHelper
  
  # Display gravatar as img tag
  # http://stackoverflow.com/a/5043452
  #
  # @param [string] email 
  # @param options {:alt, :class, :size} 
  # @return [string] image_tag 
  def gravatar_for email, options = {}
    options = {:alt => 'avatar', :class => 'avatar', :size => 80}.merge! options
    id = Digest::MD5::hexdigest email.strip.downcase
    url = 'http://www.gravatar.com/avatar/' + id + '.jpg?s=' + options[:size].to_s
    options.delete :size
    image_tag url, options
  end
  
  # Display recent user's tweets. You can define the number of tweets which will be shown.
  # http://twitter.rubyforge.org/
  #
  # @param [string] twitter_login
  # @param [integer] limit [optional] Default=3. Limit of recent tweets. 
  # @return [Array] Recent user's tweets.
  def tweets twitter_login, limit = nil      
    if !limit.nil?
      limit = limit.to_i
    else
      limit = 3
    end
    
    arr = Array.new
    i = 0        
    Twitter.user_timeline(twitter_login, :rpp => limit, :result_type => "recent").map do |status|
      arr[i] = { :from_user => status.from_user, :text => status.text }
        
      i += 1
      break if i == limit
    end
    
    arr    
  end
  
end
