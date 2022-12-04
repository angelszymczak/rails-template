# frozen_string_literal: true

require 'database_cleaner-active_record'

DatabaseCleaner.clean_with :truncation
DatabaseCleaner.strategy = :truncation

Before('@no-txn') do
  DatabaseCleaner.start
end

After('@no-txn') do
  DatabaseCleaner.clean
end
