class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :title, null: false
      t.string :tagline, null: false
      t.string :description, null: false
    end
    add_index :challenges, :title, unique: true
  end
end
