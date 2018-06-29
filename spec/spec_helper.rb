ENV["RACK_ENV"] ||= "test"

require 'bundler'

Bundler.require(:default, :test)
require File.expand_path('../../config/environment.rb', __FILE__)
require 'capybara/dsl'

Capybara.app = LaughTracksApp
Capybara.save_path = 'tmp/capybara'
Capybara.ignore_hidden_elements = false

DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.include Capybara::DSL

  c.before(:all) do
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean
  end
end
