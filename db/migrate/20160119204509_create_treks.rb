class CreateTreks < ActiveRecord::Migration
  def change
    create_table :treks do |t|
      t.string :title, null: false
      t.string :location, null: false
      t.string :description, null: false
    end
    add_index :treks, :title, unique: true
    add_index :treks, :location
  end
end
