class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.belongs_to :user, null: false
      t.belongs_to :challenge, null: false
      t.index :user_id
      t.index :challenge_id
      t.index [:user_id, :challenge_id], unique: true
      t.timestamps
    end
  end
end
