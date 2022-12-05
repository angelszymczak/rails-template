@ui_only
Feature: Register a user
  In order to create a new user
  As a Guest
  I want to register a user

  Background:
    Given a page for user registration

  Scenario: the credentials are ok
    Given a "user@sample.com" email and "pass1234" password data
    When sending registration user form
    Then user "user@sample.com" is added

  Scenario: the credentials are empty
    Given a "" email and "" password data
    When sending registration user form
    Then display required data error

  Scenario: the credentials are duplicated
    Given a "duplicated@email.com" already registered
    Given a "duplicated@email.com" email and "pass1234" password data
    When sending registration user form
    Then display duplicated data error

  Scenario: verify email format can register
    Given a "duplicated@notawllowed.com" email and "pass1234" password data
    When sending registration user form
    Then display email format error
