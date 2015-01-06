class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :challenge_id
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
