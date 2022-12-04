# IMPORTANT: This file is generated by cucumber-rails - edit at your own peril.
# It is recommended to regenerate this file in the future when you upgrade to a
# newer version of cucumber-rails. Consider adding your own code to a new file
# instead of editing this one. Cucumber will automatically load all features/**/*.rb
# files.

unless ARGV.any? { |a| a =~ /^gems/ } # Don't load anything when running the gems:* tasks
  vendor_cucumber_bin = Dir[Rails.root.join('vendor/{gems,plugins}/cucumber*/bin/cucumber')].first
  $LOAD_PATH.unshift("#{File.dirname(vendor_cucumber_bin)}/../lib") unless vendor_cucumber_bin.nil?

  require 'cucumber/rake/task'

  COMMON_OPTS = %w[--format pretty --publish-quiet --strict].freeze

  namespace :spec do
    namespace :features do
      Cucumber::Rake::Task.new(:core, 'Run the features examples with support/core config') do |t|
        t.binary        = vendor_cucumber_bin
        t.fork          = true # You may get faster startup if you set this to false
        t.profile       = 'core'
        t.cucumber_opts = %w[--exclude features/support/e2e --tags 'not @ui_only'].push(*COMMON_OPTS)
      end

      Cucumber::Rake::Task.new(:e2e, 'Run the features examples with support/e2e config') do |t|
        t.binary        = vendor_cucumber_bin
        t.fork          = true # You may get faster startup if you set this to false
        t.profile       = 'e2e'
        t.cucumber_opts = %w[--exclude features/support/core].push(*COMMON_OPTS)
      end
    end
  end
end