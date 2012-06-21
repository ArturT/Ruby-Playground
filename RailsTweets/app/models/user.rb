class User < ActiveRecord::Base
  attr_accessible :email, :last_name, :name, :twitter_login
  
  validates_presence_of :email, :last_name, :name, :twitter_login
      
  validates_length_of :name, :maximum => 25
    
  validates_length_of :last_name, :maximum => 25
  
  validates :email, :uniqueness => true
  validates_length_of :email, :maximum => 100
  validates_format_of :email, :with => /\A[^@]{1,}@[^@]{1,}\.[a-zA-z]{2,}+\z/, :message => "is not valid"
  
  validates_format_of :twitter_login, :with => /\A[a-zA-Z]+\z/, :message => "only letters allowed"
  validates_length_of :twitter_login, :maximum => 5 
end
