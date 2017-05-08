# Chitter Challenge
=================

### Objective

* To write a little twitter clone that will allow users to post messages to a public stream.

### User Stories

````
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

````
### Additional Functional Requirements

* Makers sign up to chitter with their email, password, name and a user name (e.g. sam@makersacademy.com, s3cr3t, Samuel Russell Hampden Joseph, tansaku).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.
* You don't have to be logged in to see the peeps.
* You only can peep if you are logged in.


### Installation Instructions

Clone repository:

````
git clone https://github.com/katiekoschland/chitter-challenge.git
cd chitter-challenge
bundle install
````

Create local databases:

````
psql
createdb chitter_test
createdb chitter_development
````
Migrate/upgrade databases:

````
rake db:migrate
rake db:upgrade
````
To run tests:

````
rspec
````

### Technologies Used
````
* Ruby
* Sinatra
* Postgresql
* Deployed to Heroku
* BCrypt password hashing
* Datamapper as an Object Relational Mapper
* HTML
* CSS
* RSpec
````
