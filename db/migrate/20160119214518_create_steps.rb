class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.belongs_to :challenge, null: false
      t.belongs_to :trek, null: false
      t.index :challenge_id
      t.index :trek_id
      t.index [:challenge_id, :trek_id], unique: true
      t.timestamps
    end
  end
end
