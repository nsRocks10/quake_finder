# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

file_source = "db/csv/all_month.csv"

# Read from the above csv and store the necessary data in the Eartquake model
CSV.foreach(file_source, { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
  row_hash = row.to_hash

  Earthquake.create(
  	time: row_hash[:time],
  	magnitude: row_hash[:mag],
  	magnitude_unit: row_hash[:magtype],
  	latitude: row_hash[:latitude],
  	longitude: row_hash[:longitude],
  	place: row_hash[:place],
  	quake_type: row_hash[:type]
  )
end
