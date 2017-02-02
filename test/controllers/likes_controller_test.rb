require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @like = likes(:like_60)
    @image = @like.image
    @user = @image.user
  end

  test 'should get index' do
    get likes_url, as: :json
    assert_response :success
  end

  test 'should create like' do
    assert_difference('Like.count') do
      post likes_url, params: { like: { by: 1 } }, as: :json
    end

    assert_response 201
  end

  test 'should show like' do
    get like_url, as: :json
    assert_response :success
  end

  test 'should destroy like' do
    assert_difference('Like.count', -1) do
      delete like_url, as: :json
    end

    assert_response 204
  end

  def like_url
    user_image_like_url(@user.id, @image.id, @like.id)
  end

  def likes_url
    user_image_likes_url(@user.id, @image.id)
  end
end
