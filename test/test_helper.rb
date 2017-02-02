ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  self.use_transactional_tests = true
  set_fixture_class votes: Like

  # Add more helper methods to be used by all tests here...
  # def authenticate_headers
  #   {'HTTP_AUTHORIZATION' => 'Basic ' + Base64.encode64('truecar:truecar')}
  # end
end
