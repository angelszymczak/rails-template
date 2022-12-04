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
9. Capybara for real user interactions with web app
   - bundler add capybara -g development,test
   - Selenium-WebDriver for Capybara web browser interaction support
     - bundler add webdrivers -g development,test --require webdrivers/chromedriver
10. BDD Framework for Business Readability Factor
    - bundler add cucumber-rails -g development,test --require false
    - bundler add database_cleaner-active_record -g development,test --require false
11. SimpleCov coverage reports
    - bundler add simplecov -g test --require false
12. SimpleCov Shields Badge
    - bundler add simplecov-shields-badge -g test --require false
    - [![Coverage](badge.svg)](https://angelszymczak.github.io/rails-template)
13. Guard watcher for live testing run
    - bundler add guard -g test,development
    - bundler add guard-rspec -g test,development --require false
14. Rubocop style linter
    - bundler add rubocop -g test,development
    - bundler add rubocop-rails -g test,development --require false
    - bundler add guard-rubocop -g test,development
    - Fixing offenses
      - rubocop -A --only Style/FrozenStringLiteralComment
      - rubocop -A --only Layout/EmptyLineAfterMagicComment
      - rubocop -A --only Style/HashSyntax
      - rubocop -A --only Style/MutableConstant
      - rubocop -A --only Style/RedundantFetchBlock
      - rubocop -A --only Lint/RedundantDirGlobSort
      - rubocop -A --only Style/StringConcatenation
      - rubocop -A --only Style/GlobalStdStream
      - rubocop -A --only Layout/SpaceInsideArrayLiteralBrackets
      - rubocop -A --only Layout/SpaceInsidePercentLiteralDelimiters
      - rubocop -A --only Style/SymbolArray
      - rubocop -A --only Style/CommentAnnotation
      - rubocop -A --only Style/BlockComments
      - rubocop -A --only Layout/CommentIndentation
      - manual -> Rails/FilePath
      - manual -> Lint/ConstantDefinitionInBlock
      - manual -> Lint/ScriptPermission
      - manual -> Bundler/OrderedGems
15. Rubocop-Rspec extension
    - bundler add rubocop-rspec -g test,development
16. Fuubar progression bar for spec feedback instead dots
    - bundler add fuubar -g test,development
17. Annotate tool for models columns auto doc
    - bundler add annotate -g test,development

## BDD/TDD
- system spec
  - e2e spec => e2e with web browser automation and recorded fixed real data
  - core spec => e2e with headless web browser automation and recorded fixed real data
- request spec => http layer with mock I/O all path authorization/authentication it should talk with I/O test interface
- model spec => domain layer it should talk with I/O test interface

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
