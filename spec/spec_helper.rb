$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
ENV["RAILS_ENV"] ||= 'test'

require 'gotransverse-tract-api'
require 'rspec'
require 'pry'
require 'active_support/all'
require 'auth_helper'

#require 'factory_girl'
#require 'ffaker'
#require 'shoulda'


#Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.

RSpec.configure do |config|
  #config.include FactoryGirl::Syntax::Methods

  config.include AuthHelper
end
