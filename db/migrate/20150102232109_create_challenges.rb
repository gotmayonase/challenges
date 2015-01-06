class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.datetime :starts_at
      t.datetime :ends_at
      t.text :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
