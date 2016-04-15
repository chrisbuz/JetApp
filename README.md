## README

This is our CSCE 431 Application. It's purpose is to improve students ideas, before they get involved with 3DayStartup.

To view this application on your own machine follow these steps:

* git clone https://github.com/wvance/jetapp

* cd jetapp

* bundle install

* rake db:migrate

* rails server

* Open a browser and navigate to localhost:3000

You should now be able to see our application in your browser


## Running Tests

Preconditions: Please make sure you have the rails server running

* Move to the JetPack (or JetApp) directory

* Run:

      `bundle exec cucumber dir/to/the/feature`

* Example: 

      `bundle exec cucumber feature/add_comment.feature`

* Note: For a successful test, all steps must indicate GREEN
