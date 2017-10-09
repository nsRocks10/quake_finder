class EarthquakesController < ApplicationController
  def search
  	# No logic as it only displays a form
  end

  def index
  	# If coordinates are not present, default to Los Angeles coordinates (34.0522, -118.2437)
		latitude = params[:latitude].present? ? params[:latitude].to_f : 34.0522
		# Had to use negative value as the csv data has negative values for all cities near Los Angeles and gives correct results.
		longitude = params[:longitude].present? ? params[:longitude].to_f : -118.2437

		# Start date is 30 days past by default
		start_date = params[:start_date].present? ? DateTime.parse(params[:start_date]) : DateTime.now - 30

		# End date is current date by default
		end_date = params[:end_date].present? ? DateTime.parse(params[:end_date]) : DateTime.now

		# Get all earthquakes between above start and end date to reduce the data set.
		@earthquakes = Earthquake.find_by(start_date, end_date, latitude, longitude)
  end

 	def show
 		@earthquake = Earthquake.find(params[:id])
 	end
end
