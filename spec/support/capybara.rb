# frozen_string_literal: true

require 'capybara/rails'

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :selenium, using: :chrome, screen_size: [640, 480]
  end
end
