class Timesheet < ActiveRecord::Base
  belongs_to :user
  has_many :task_times
  has_many :tasks, :through=>:task_times
  
  validates_with StartBeforeEndValidator
  
  validates :user_id, :presence=>true
  validates :tasks, :length=>{:minimum=>1, :unless=>:open?}
  validates :start_time, :future_date=>true
  validates :end_time, :future_date=>true
  
  
  
  def after_initialize
    self.start_time = Time.now if self.start_time.nil?
  end
  
  def open?
    self.end_time.nil?
  end
  
  def end!(ending = Time.now)
    self.end_time = ending
    save
  end
  
  def time_spent
    (end_time - start_time).to_i/60
  end
  
end
