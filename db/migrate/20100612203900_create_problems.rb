class CreateProblems < ActiveRecord::Migration
  def self.up
    create_table :problems do |t|
      t.string :title
      t.text :desciption
      t.text :solution
      t.integer :user_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :problems
  end
end
