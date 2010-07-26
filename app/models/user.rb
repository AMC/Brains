class User < ActiveRecord::Base
  
  has_many :problems
  has_many :comments
  has_many :timesheets
  
  has_attached_file :avatar,
                    :url => "avatars/:basename.:extension",
                    :path => ":rails_root/public/images/avatars/:basename.:extension"
  
  acts_as_authentic do |c|
      #c.my_config_option = my_value # for available options see documentation in: Authlogic::ActsAsAuthentic
  end # block optional


  def has_open_timesheet?
    !timesheets.where(:end_time=> nil).empty?
  end
  
  def open_timesheet
    return nil unless has_open_timesheet?
    timesheets.where(:end_time=>nil).first
  end

end