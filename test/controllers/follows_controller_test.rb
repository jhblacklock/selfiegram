require 'test_helper'

class FollowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:user_1)
    @follow = follows(:follow_1)
  end

  test 'should get index' do
    get follows_url, as: :json
    assert_response :success
  end

  test 'should create follow' do
    assert_difference('@user.followers.count') do
      post follows_url, params: { follow: { by: 3 } }, as: :json
    end

    assert_response 201
  end

  test 'should destroy follow' do
    assert_difference('Follow.count', -1) do
      delete follow_url, as: :json
    end

    assert_response 204
  end

  def follows_url
    user_follows_url(@user.id)
  end

  def follow_url
    user_follow_url(@user.id, @follow.id)
  end
end
