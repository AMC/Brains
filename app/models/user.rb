class User < ActiveRecord::Base
  has_many :problems
  
  has_attached_file :avatar,
                    :url => "avatars/:basename.:extension",
                    :path => ":rails_root/public/images/avatars/:basename.:extension"
  
  acts_as_authentic do |c|
      #c.my_config_option = my_value # for available options see documentation in: Authlogic::ActsAsAuthentic
  end # block optional
  
end