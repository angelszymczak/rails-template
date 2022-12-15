@ui_only
Feature: Login a user
  In order to create a new session
  As a Registered User
  I want to login a new session

  Background:
    Given a page for user login

  Scenario: the credentials are ok
    Given a "user@sample.com" email and "Valid1!!" password data
    And as a registered user
    When sending user login form
    Then user "user@sample.com" is logged-in
