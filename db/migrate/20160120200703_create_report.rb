class CreateReport < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.belongs_to :user, null: false
      t.belongs_to :trek, null: false
      t.datetime :starts_at, null: false
      t.datetime :ends_at
      t.integer :duration
      t.decimal :distance
      t.string :weather
      t.string :conditions
      t.integer :difficulty
      t.boolean :public, default: false
      t.text :report, null: false
    end
  end
end
