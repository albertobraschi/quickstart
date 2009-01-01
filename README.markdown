# base app

Use this example Rails application as a basis for a typical web application.

### Features

* visitors register ("sign up") to create a user account
* new users are emailed a link to verify their email address and activate their account
* users "log in" to use the application by providing a username and password
* a "forgotten password" feature sets a new password for a user
* some users can be assigned an administrator role to edit or delete other users
* user management and authentication is implemented with a RESTful architecture
* user status managed with the "acts as state machine" (AASM) gem
* Email messages can be sent using a Google gmail account (tls file in lib folder)
* RSpec stories and examples

## Dependencies

* Runs under Rails 2.2

## Rails Plugins Used

* restful\_authentication
* jrails
* paperclip

## Ruby Gems
* rspec
* rspec-rails
* will\_paginate
* act\_as\_state\_machine

## Get It

The source code is managed with Git (a version control system) and hosted at GitHub. You'll need Git on your machine (install it from [http://git.or.cz/](http://git.or.cz/)).

You can download the app ("clone the repository") with the command

	$ git clone git://github.com/fortuity/origin_restful_authentication.git

## Configure Email

The application has been configured to use a Google gmail account to send confirmation emails to new users. Using a Google gmail account means you can host the application with a hosting provider who does not provide email services.

Configure email by modifying

	config/config.yml (or create "config/config.local.yml")
	
Alternatively, if you have an email server for your domain, you can use your own email server by modifying

	config/initializers/mail.rb
		
## Set Up the Database

You'll need to be in the application root directory:
    
	$ cd origin_restful_authentication

You can use the default settings if you're using SQLite. 

	$ cp config/database.sample.yml config/database.yml

If you're using MySQL, you'll need to edit the file

	config/database.yml

Running the database migrations sets up a user named "admin" with a password "admin" and a role of "administrator". You can modify the file

	config/config.yml

if you wish to change the administrator name and password before you run the migration.
	
Set up the database by running

	$ rake db:create:all
	$ rake db:migrate

If you get an error

	SQLite3::SQLException: no such table
	
it means you didn't run the database migration.
	
## Getting Started

Start the server

	$ script/server

and go to http://localhost:3000/. 

To sign in as the pre-configured admin user, (unless you've changed it) use

		name: admin
		password: admin

You should change the admin user name and password after you log in.

## Deploy

Before you deploy to production, be sure to replace example values such as http://www.mydomain.com/ with your site information in the file:

	config/config.yml
	
For full security, change the REST\_AUTH\_SITE\_KEY in 

	config/initializers/site_keys.rb

## Running RSpec

RSpec is a framework for creating specifications and testing a Rails web application. 

You can run RSpec "stories" to see the specifications for the application's behavior. You can run RSpec "examples" to verify the application is behaving as intended at the object level.

You must prepare the test database before running RSpec:

	$ rake db:test:prepare
	
which takes a schema dump from the development database and uses it to create a test database. (If you're modifying the app, you'll need to do that after every migration.)

Be sure that you've prepared the app to send email:

* set your gmail login and password in config/config.yml
* or modify config/initializers/mail.rb
	
or you will get many failures when you run RSpec.

To see the RSpec stories:

	$ ruby stories/all.rb

To run the RSpec examples:

	$ rake spec

When you run RSpec stories or examples, real email messages are sent. You may get "mail undelivered" bounce messages unless you change email addresses throughout the RSpec code. Search and replace for "rspectest.com" if the bounce messages irritate you.
	
## To Do

* Add RSpec examples and stories to cover more "Bells and Whistles" features
* Change stories from StoryRunner to Cucumber
* Change "login" to use email addresses instead

## Credits

* Rick Olson (and contributors) for the Restful Authentication Generator plugin
* "activefx" for "Restful Authentication With All the Bells and Whistles"
* Scott Barron for the "acts as state machine" plugin
* http://github.com/fortuity/origin_restful_authentication/tree , use as base for this app... thanks