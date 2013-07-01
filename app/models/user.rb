class User < ActiveRecord::Base
  attr_accessible :user_name, :pass_word
end