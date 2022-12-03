# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

* 3.1.2

## Workbook
1. Create Rails Project with EsBuild for JavaScript bundling, PostgreSQL for Database, and skip Suite.
   - rails new rails-template --javascript=esbuild --database=postgresql -T
2. Suite Testing setup
   - bundler add rspec-rails -g development,test
   - bin/rails g rspec:install
3. Enable testing plugin support path
4. Factory Method and Object Mother (Model's) design pattern
   - bundler add factory_bot_rails -g development,test
5. Faker testing data generator
   - bundler add factory_bot_rails -g development,test
6. Shoulda Matchers for ActiveRecord & ActiveModel
   - bundler add shoulda-matchers -g development,test
7. Assign Matchers for controllers
   - bundler add rails-controller-testing -g development,test
8. Negated Matcher for Rspec

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
