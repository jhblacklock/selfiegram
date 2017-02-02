require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest
  test 'should get routes' do
    get '/'
    assert_response :success
  end
end
