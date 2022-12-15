# frozen_string_literal: true

Given('a page for user login') do
  visit('/login')
  expect(page.find('#user_login_form')).to be_present
end

Given('as a registered user') do
  expect { FactoryBot.create(:user, @data) }.to change { User.count }.by(1)
end

When('sending user login form') do
  within('#user_login_form') do
    fill_in('user_email', with: @data[:email])
    fill_in('user_password', with: @data[:password])
  end
  click_button('Login')
end

Then('user {string} is logged-in') do |guest_email|
  expect(page).to have_content("Welcome #{guest_email}")
end
