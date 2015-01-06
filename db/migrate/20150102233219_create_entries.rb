class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.belongs_to :user, index: true
      t.belongs_to :challenge, index: true

      t.timestamps null: false
    end
    add_foreign_key :entries, :users
    add_foreign_key :entries, :challenges
  end
end
