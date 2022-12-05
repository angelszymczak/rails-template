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
    fill_in('user_email', with: @data[:email])
    fill_in('user_password', with: @data[:password])
  end
  click_button('Register')
end

Then('user {string} is added') do |guest_email|
  expect(find('#user').find('#email')).to have_content(guest_email)
end

Then('display required data error') do
  expect(find('#user_errors')).to have_content(/Email can't be blank/)
  expect(find('#user_errors')).to have_content(/Password can't be blank/)
end

Given('a {string} already registered') do |duplicated_email|
  FactoryBot.create(:user, email: duplicated_email)

  expect(User.find_by(email: duplicated_email)).to be_present
end

Then('display duplicated data error') do
  expect(find('#user_errors')).to have_content(/Email has already been taken/)
end

Then('display email format error') do
  expect(find('#user_errors')).to have_content(/Email invalid format error/)
end
