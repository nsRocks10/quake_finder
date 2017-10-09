class Earthquake < ActiveRecord::Base
	attr_accessor :distance

	class << self
		def find_by(start_date, end_date, curr_latitude, curr_longitude)
			# First get all earthquakes within the date range
			Earthquake.where(time: start_date..end_date).select do |earthquake|
				dist_between_city_n_quake =
					haversine_distance(curr_latitude, curr_longitude, earthquake.latitude, earthquake.longitude)
		  		
				# The affected area is proprtional (100 times) to the magnitude of the quake
		  		dist_affected_by_quake = earthquake.magnitude.present? ? earthquake.magnitude * 100 : 0
		  		earthquake.distance = dist_between_city_n_quake

		  		# Only select the earthquakes whose affected area is larger than the distance between its origin n your city
		  		dist_affected_by_quake >= dist_between_city_n_quake
			end
		end

		private

		def haversine_distance(curr_latitude, curr_longitude, quake_latitude, quake_longitude)
			# Convert all coordinates to radians
			curr_latitude_rad = convert_to_radians(curr_latitude)
			curr_longitude_rad = convert_to_radians(curr_longitude)
			quake_latitude_rad = convert_to_radians(quake_latitude)
			quake_longitude_rad = convert_to_radians(quake_longitude)

			delta_latitude = quake_latitude_rad - curr_latitude_rad
			delta_longitude = quake_longitude_rad - curr_longitude_rad

			a = Math::sin(delta_latitude/2)**2 + (Math::cos(curr_latitude_rad) * Math::cos(quake_latitude_rad) * Math::sin(delta_longitude/2)**2)
			c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))
			dist = (3959 * c).round(2) # 3959 is earth's radius and we round the distance to 2 decimals
		end

		def convert_to_radians(degrees)
			degrees * 0.0174533
		end
	end
end
