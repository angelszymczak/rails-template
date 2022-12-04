# frozen_string_literal: true

Given('a page for user registration') do
  visit('/signup')
  expect(page.find('#user_registration_form')).to be_present
end
