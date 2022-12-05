@ui_only
Feature: Register a user
  In order to create a new user
  As a Guest
  I want to register a user

  Background:
    Given a page for user registration

  Scenario: the credentials are ok
    Given a "user@sample.com" email and "Valid1!!" password data
    When sending registration user form
    Then user "user@sample.com" is added

  Scenario: the credentials are empty
    Given a "" email and "" password data
    When sending registration user form
    Then display required data error

  Scenario: the credentials are duplicated
    Given a "duplicated@email.com" already registered
    Given a "duplicated@email.com" email and "Valid1!!" password data
    When sending registration user form
    Then display duplicated data error

  Scenario: verify email format allowed with lowercase/uppercase Latin letters A-Za-z, digits 0-9, underscore, medium
  dash, plus, and periods for the local section and 'email.com | mail.com | sample.com' domains.
    Given a "duplicated@notawllowed.com" email and "Valid1!!" password data
    When sending registration user form
    Then display email format error

  Scenario: verify the password format allowed with
  a minimum length of 8 characters and
  a maximum length of 32 characters,
  at least is required
  1 digit,
  1 uppercase letter,
  1 lowercase letter,
  1 symbol
  and avoid spaces.
    Given a "valid@mail.com" email and "bad key" password data
    When sending registration user form
    Then display password format error
