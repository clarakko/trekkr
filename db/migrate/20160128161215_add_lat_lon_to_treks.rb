class AddLatLonToTreks < ActiveRecord::Migration
  def change
    add_column :treks, :lat, :string
    add_column :treks, :lon, :string
  end
end
