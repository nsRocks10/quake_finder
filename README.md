# quake_finder
This RoR test project reads a csv file containing earthquakes data and returns a list of eathquakes that affected your city.

How to run the project:
1. Download n unzip the folder and go to the project folder in the terminal
2. In the command line type the following cmds
rake db:migrate
rake db:seed

3. The above commands should run the migrations to create the sqlite3 db and populate it with the seed data (pulled from the csv file)
4. You can check if your earthquakes db table is populated by typing 'rails db' and quering the sqlite3 db e.g.
'select * from earthquakes LIMIT 10', the query should return 10 rows to make sure the migrations and seed cmds worked fine.

5. Run the rails server locally, using 'rails s' and navigate to http://localhost:3000/earthquakes/search
Here you will be able to fill out a simple form. Just follow the instructions on the form and hit 'Find Earthquakes' button.

6. This should display a list of earthquakes that occured within the specified time period and which affected your city.
7. You can view additional details of each earthquake by clicking the 'Show' link.
8. You can navigate back using the browser back button and the 'Back to search' link.

Project Design n Test Details:
1. This is a very basic solution to implement the coding assessment
2. There are no validations done of any kind due to time constraints
3. There are no tests written due to time contraints, Hope this does not hurt :)
4. The seed data is parsed to create model objects with only the necessary attributes required for this assignment. We can add more attributes in future to the model as per need.
5. The model methods are a little restricted and not flexible enough (for the purpose of this coding assessment only) for any future additions but that can be refactores easily. Maybe move the distance calculation logic to some other place, other than the model.
6. I used a RoR approach as the UI makes the application easy to use and understand.

Project Files:
The following files have been added/updated
db/seeds.rb
routes.rb
earthquake migrations files
controllers/eartquakes_controller.rb, modelsearthquake.rb, views/earthquakes

Project Extensions:
1. Keep in mind that the data is updated on a regular basis here. How would you handle this?
I see there are web services available for the same data https://earthquake.usgs.gov/fdsnws/event/1/
e.g. https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2017-09-01&endtime=2017-10-01
This would be helpful, as hitting these services would return the latest data in json format which can be deserialized in to our model objects and used for further logic. I havent implemented this approach, but something worth doing.

