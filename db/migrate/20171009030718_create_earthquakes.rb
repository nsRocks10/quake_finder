class CreateEarthquakes < ActiveRecord::Migration
  def change
    create_table :earthquakes do |t|
      t.datetime :time
      t.float :magnitude
      t.string :magnitude_unit
      t.float :latitude
      t.float :longitude
      t.string :place
      t.string :quake_type

      t.timestamps null: false
    end
  end
end
