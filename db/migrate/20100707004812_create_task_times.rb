class CreateTaskTimes < ActiveRecord::Migration
  def self.up
    create_table :task_times do |t|
      t.integer :task_id
      t.integer :timesheet_id

      t.timestamps
    end
  end

  def self.down
    drop_table :task_times
  end
end
