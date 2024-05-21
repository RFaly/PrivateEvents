# Project: Private events
You want to build a site similar to a private Eventbrite which allows users to create events and then manage user signups.

A user can create events. A user can attend many events. An event can be attended by many users. Events take place at a specific date and at a location (which you can just store as a string, like “Andy’s House”).

* How to start the app
Clone the repository, go to the folder, open terminal and run this:
```console
bundle install && rails db:migrate && rails server
```

* Ruby version
3.2.2

* Database creation
This app use the sqlite the default db for rails to simplify the startup of the project

* Database initialization
```console
rails db:migrate db:seed
```

* How to run the test suite
```console
bundle exec rspec 
```

* Diagrame
![Alt text](public/diagrame.png)
