class CreateCompletedTasks < ActiveRecord::Migration
  def change
    create_table :completed_tasks do |t|
      t.belongs_to :task, index: true
      t.belongs_to :user, index: true
      t.string :note

      t.timestamps null: false
    end
    add_foreign_key :completed_tasks, :tasks
    add_foreign_key :completed_tasks, :users
  end
end
