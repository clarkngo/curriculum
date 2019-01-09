# curriculum

This project aims to solve the problem of proposing a new curriculum in computer science, to replace an old curriculum.

## Soon!

This app powers curriculum located [http://curriculum-clark-ngo.herokuapp.com] (Heroku Project URL)

## Getting Started

## Software requirements

- Rails 5.0.0 or higher

- Ruby 2.3.1 or higher

- PostgreSQL 9.3.11 or higher

## Create Account in GitHub and Heroku

<a href="https://github.com/">GitHub</a>

<a href="https://www.heroku.com/">Heroku</a>

## Setup your development environment (Mac)

Download vagrant files here: <a href="https://github.com/FirehoseProject/firehose-vagrant-rails5/raw/master/tools/vagrant.zip?raw=true">vagrant.zip</a>

Save to your Desktop

Unzip the file, it will create a folder called vagrant on your Desktop. This is where all your web development environment will live.

## Install Tools for development environment (Mac)

Go to the VirtualBox Website, click the link to Download "OS X hosts". Open the dmg file that downloads, then double click on VirtualBox.pkg that pops up and follow the instructions (you're clicking continue most of the time). Once you go through that step close out the "VirtualBox" window.

Go to the <a href="http://www.vagrantup.com/downloads.html">Vagrant Download</a> Page, click Find the Mac OS X section and click "Universal (32 and 64-bit)". Run the file you downloaded and follow the instructions (you're clicking next most of the time)

## Turn on your Web Dev environment

```
cd ~/Desktop/vagrant
vagrant up
vagrant ssh
```

## Accounts SSH Key

Generate SSH Key
Inside the web development terminal window, where it says [Web Dev] in blue, run the following lines one by one. important note: the command has backticks (`) not single-quotes ('), either copy and paste the command or if you type it use the key to the left of the 1 to type the backtick in the first line:
```
eval `ssh-agent -s`
ssh-keygen -t rsa -C "Firehose Vagrant" -N '' -f ~/.ssh/id_rsa
ssh-add ~/.ssh/id_rsa
```

## Configure Heroku with SSH Keys
update the heroku-cli with the following command:
```
wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh
heroku login
heroku keys:add
```

## Configure Github with SSH Keys
```
curl https://gist.githubusercontent.com/kenmazaika/fa8ea7dfbae413638cfd111b974bc74a/raw/ecb5e91c044d92389d0cfd3c2229e57187384d6d/github_auth.rb  > ~/.firehose-github.rb && ruby ~/.firehose-github.rb
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

## Test
```
cd /vagrant/src/curriculum
rails s -b 0.0.0.0 -p 3000
```

## Clone this repository
```
git clone git@github.com:clarkngo/curriculum.git
```

## Navigate to the Rails application

```
$ cd curriculum
```

## Create, migrate and seed the database

 ```
 $ rails db:create
 $ rails db:migrate
 $ rake db:seed
 ```

## Starting the local server

```
$ rails server

   or

$ rails s
```

## Production Deployment

  ```
  $ git push heroku master
  $ heroku run rake db:migrate
  ```

## Support

Bug reports and feature requests can be filed with the rest for the Ruby on Rails project here:

* [File Bug Reports and Features](https://github.com/clarkngo/curriculum/issues)

## License

curriculum is released under the [MIT license](https://mit-license.org).

## Copyright

copyright:: (c) Copyright 2018 Clark Jason Ngo. All Rights Reserved.


# ---

# Items in Planning Phase and Requirements Gathering


Requirements (scoping what to do deliver) 


scope creep (when people start adding stuff outside the requirements)

what components needed

workflow diacourses, how to interact with the system

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



# ---

# Planning Phase and Requirements Gathering

## Scope

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
* string - name
* text - description
* integer - user_id
* datetime - created_at
* datetime - updated_at
* index - user_id, name: index_courses_on_user_id

##### Table Comments
* text - message
* string - rating
* integer - user_id
* datetime - created_at
* datetime - updated_at
* index - course_id, name: index_comments_on_course_id
* index - user_id, course_id, name: index_comments_on_user_id_and_course_id

##### Table Users (generate by Devise Gem)
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


### User Story

1. A user should be able to create an account
2. A user should be able to create a course
3. A user should be able to edit a course
4. A user should be able to update a course
5. A user should be able to destroy a course
6. A user should be able to comment on a course

### Features

Drop and drop functionality of reording courses

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


