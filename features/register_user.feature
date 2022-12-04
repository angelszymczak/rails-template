@ui_only
Feature: Register a user
  In order to create a new user
  As a Guest
  I want to register a user

  Background:
    Given a page for user registration

  Scenario: the credentials are ok
    Given empty users
    And a "user@sample.com" email and "pass1234" password data
    When sending registration user form
    Then user "user@sample.com" is added
