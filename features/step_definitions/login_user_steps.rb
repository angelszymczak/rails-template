# frozen_string_literal: true

Given('a page for user login') do
  visit('/login')
  expect(page.find('#user_login_form')).to be_present
end

When('sending user login form') do
  within('#user_login_form') do
    fill_in('user_email', with: @data[:email])
    fill_in('user_password', with: @data[:password])
  end
  click_button('Login')
end

Then('user {string} is logged-in') do |guest_email|
  expect(find('#user').find('#email')).to have_content(guest_email)
end
