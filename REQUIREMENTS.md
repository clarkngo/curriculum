# Items in Planning Phase and Requirements Gathering


Requirements (scoping what to do deliver) 

Note: scope creep (when people start adding stuff outside the requirements)

what components needed

workflow diagram, how to interact with the system

wireframes

high-level description on the project

repo and stuff

functional requirements, use case

high-level architecture (in Readme)

build these architectural pieces = components

database, schema, API, well-defined endpoint

tests, automated testing and manual testing, do both

write documentation, how can someone use the system

publish in GitHub



# Planning Phase and Requirements Gathering

## Scope

This App only provides users to suggest, comment and rate courses.

## Technologies
### Client Side Scripting / Coding - Client Side Scripting is the type of code that is executed or interpreted by browsers.


HTML
CSS
JavaScript
BootStrap

### Server Side Scripting / Coding - Server Side Scripting is the type of code that is executed or interpreted by the web server.
Ruby on Rails

### Database

PostgreSQL

#### Schema

##### Table Courses

A Course has many comments
A Course belongs to a user

* string - name
* text - description
* integer - user_id
* datetime - created_at
* datetime - updated_at
* index - user_id, name: index_courses_on_user_id

##### Table Comments
* text - message

A Comment has a Course
A Comment belongs to a user

* string - rating
* integer - user_id
* datetime - created_at
* datetime - updated_at
* index - course_id, name: index_comments_on_course_id
* index - user_id, course_id, name: index_comments_on_user_id_and_course_id

##### Table Users (generate by Devise Gem)

A User has many courses
A User has many comments

* string - email
* string - password
* string - reset_password_token
* datetime - reset_password_sent_at
* datetime - remember_created_at
* datetime - created_at
* datetime - updated_at
* index - email, name: index_users_on_email
* index - reset_password_token, name: index_users_on_reset_password_token 

### Ruby Gems
* BootStrap
* Simple Form
* Devise
* RankedModel???

### Cloud Hosting

Heroku

### Description

This project aims to solve the problem of proposing a new curriculum in computer science, to replace an old curriculum.

### Wireframe

https://www.figma.com/file/CPh3L1tuW8t70gH315hQLhje/Curriculum?node-id=0%3A1


### Functional Requirements

#### User Story

1. A user should be able to create an account
2. A user should be able to create a course
3. A user should be able to edit a course
4. A user should be able to update a course
5. A user should be able to destroy a course
6. A user should be able to comment on a course

### Features

Drop and drop functionality of reording courses

### High-Level Architecture

Soon! Image version

#### User Interface

Client requests (HTTP) Web Server

Web Server forwards Dispatcher

Dispatcher loads Controller

Contoller renders Action View

Contoller delegates Action WebServices

Contoller delivers Action Mailer

Contoller CRUDs Active Record

Action View displays (HTML, CSS, JavaScript) to Client

Action WebServices responds to Client

Active Record responds to Controller

Active Record queries Database (PostgreSQL)

Database (PostgreSQL) responds with data or error to Active Record


### Work Flow Diagram

Soon! Image version

Start

Index Page

on an existing course

-> comments on a course

if user is signed in, allow the comment (message and rating, suggest a Course???)

else, flash error.




### Test-Driven Development

#### describe "course#index action"

it "should succesfully show the page"


#### describe "course#show action"
it "should successfully show the page if the course is found"

it "should return a 404 error if the course is not found"

#### describe "course#new action"

it "should require users to be logged in"

it "should successfully show the new form"

#### describe "course#create action"
it "should require users to be logged in"

it "should successfully create a new course in our database"

it "should properly deal with validation errors"

#### describe "course#edit action"
it "shouldn't let a user who did not create the course edit a course"

it "shouldn't let unauthenticated users edit a course"

it "should successfully show the edit form if the course is found"

it "should return a 404 error message if the course is not found"

#### describe "course#update action"

it "shouldn't let users who didn't create the course update it"

it "shouldn't let unauthenticated users update a course"

it "should allow users to successfully update courses"

it "should have http 404 error if the course cannot be found"

it "should render the edit form with an http status of unprocessable_entity"

#### describe "courses#destroy action"

it "shouldn't allow users who didn't create the course to destroy it" do


it "shouldn't let unauthenticated users destroy a course" do


it "should allow a user to destroy courses" do


it "should return a 404 message if we cannot find a course with the id that is specified" do

# SETUP INSTRUCTIONS

## Build the App

### Enable your Vagrant Environment

### Create a Rails App with PostgreSQL as database

At your terminal,

```bash
cd/vagrant/src
```

Create and name your app
```
rails new APP_NAME --database=postgresql
```

### Configure YML files

Edit  `database.yml`

After this line: `pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>`

Add this code block:

```
username: postgres
password: password
host: localhost
```

After this line: `database: curriculum_production`

Comment out this code block:

```
# username: APP_NAME
# password: <%= ENV['APP_NAME_DATABASE_PASSWORD'] %>
```

### Creating the database

Navigate to the project's folder

```bash
cd/vagrant/src/APP_NAME
```

Command to create database
```bash
rails db:create
```

### Start the server

Test the rails app

```bash
rails server -b 0.0.0.0 -p 3000
```

## Pipeline

### Setup Git - your local version control

```bash
git init
git add --all
git commit -am "Initial commit"
```

### Setup GitHub - your cloud version control

Go to GitHub.com. Login & click on the green "New repository" button.

```bash
git remote add origin git@github.com:YOUR_GITHUB_USERNAME/APP_NAME.git
git push -u origin master
```

### Deploying to Heroku - host your app in the cloud

Deploy app in Heroku

```bash
heroku create APP_NAME-FIRST_NAME-LAST_NAME
git push heroku master
```

See app URL here:

```bash
heroku apps:info
```
