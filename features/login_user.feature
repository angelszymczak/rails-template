@ui_only
Feature: Login a user
  In order to create a new session
  As a Registered User
  I want to login a new session

  Background:
    Given a page for user login

  Scenario: the credentials are ok
    Given a "user@sample.com" email and "Valid1!!" password data
    When sending user login form
    Then user "user@sample.com" is logged-in

  Scenario: the credentials are empty
    Given a "" email and "" password data
    When sending user registration form
    Then display required data error

  Scenario: the credentials are wrong.
    Given a "not-registered@mail.com" email and "some_pass" password data
    When sending user registration form
    Then display credentials log-in error
