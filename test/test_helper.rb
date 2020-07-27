ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  # parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

module LoginHelper
  def login(user)
    post "/sessions", params: { session_form: { id_name: user.id_name, password: user.masked_password ^ 1234 }}
    follow_redirect!
  end
end

class ActionDispatch::IntegrationTest
  include LoginHelper
end
