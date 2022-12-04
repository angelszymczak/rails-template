# frozen_string_literal: true

Given('a page for user registration') do
  visit('/signup')
  expect(page.find('#user_registration_form')).to be_present
end

Given('a {string} email and {string} password data') do |guest_email, guest_password|
  @data = { email: guest_email, password: guest_password }
end

When('sending user registration form') do
  within('#user_registration_form') do
    fill_in('email', with: @data[:email])
    fill_in('password', with: @data[:password])
  end
  click_button('Register')
end
