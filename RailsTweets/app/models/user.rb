class User < ActiveRecord::Base
  attr_accessible :email, :last_name, :name, :twitter_login
end
