# frozen_string_literal: true

unless Rails.env.production?
  Dotenv.require_keys('APP_NAME')
end

