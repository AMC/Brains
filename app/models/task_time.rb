class TaskTime < ActiveRecord::Base
  belongs_to :task
  belongs_to :timesheet
end
