# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

Project Setup:

mkdir basic_rails
cd basic_rails
rvm use ruby-3.0.0@basic_rails --ruby-version --create
rvm gemset list
gem install rails -v 6.1.7.6
rails new . -T --database=postgresql
