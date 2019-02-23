# curriculum

This project aims to solve the problem of proposing a new curriculum in computer science, to replace an old curriculum.

## View Project Requirements

<a href="https://github.com/clarkngo/curriculum/projects">Project Requirements</a>

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

## Configure Heroku with SSH Keys
update the heroku-cli with the following command:
```
wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh
heroku login
heroku keys:add
```

## Test
```
cd /curriculum
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

## Setups

### Setup for `config/master.key`


1) Run `rails credentials:edit`
2) Store credentials to open in Emacs edtior

```
aws:
  access_key_id: 123
  secret_access_key: 345
  bucket: my_bucket
```

3) Ctrl + C,then `s` then `y` to save.
4) Share master key to team. Should not be pushed to repo.

Common Gotcha: 
```
'rescue in _decrypt': ActiveSupport::MessageEncryptor::InvalidMessage (ActiveSupport::MessageEncryptor::InvalidMessage)
```

1) Delete `credentials.yml.enc` and `master.key`
2) Run `rails credentials:edit`

### Setup for `config/application.yml`

Add the following in the file:

```
AWS_ACCESS_KEY: Your_AWS_access_key_here
AWS_SECRET_KEY: Your_AWS_secret_key_here
AWS_BUCKET: Your_AWS_bucket_here
```

## Support

Bug reports and feature requests can be filed with the rest for the Ruby on Rails project here:

* [File Bug Reports and Features](https://github.com/clarkngo/curriculum/issues)

## License

curriculum is released under the [MIT license](https://mit-license.org).

## Copyright

copyright:: (c) Copyright 2018 Clark Jason Ngo. All Rights Reserved.

