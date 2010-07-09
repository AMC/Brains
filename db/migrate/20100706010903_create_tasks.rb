class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.boolean :finished
      t.integer :project_id
      t.integer :priority
      t.integer :user_id
      t.date :due_date
      t.date :date_finished
      t.boolean :critical_path
      
      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
