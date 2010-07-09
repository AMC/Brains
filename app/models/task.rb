class Task < ActiveRecord::Base
  
  has_many :task_times
  has_many :timesheets, :through=> :task_times
  validates_presence_of :name
  validates_presence_of :description
  validates_inclusion_of :priority, :in => 1..10, :message => "%{value} is not an accepted priority"
  
  def finish!
    return false if new_record?
    self.date_finished = Date.today
    self.finished = true
    save
  end
  
  def time_spent
    t = timesheets.where("end_time is not null")
    t.inject(0) {|total,time| total += time.time_spent}
  end
  
end
