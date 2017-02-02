require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image = images(:image_1)
    @user = @image.user
  end

  test 'should get index' do
    get images_url, as: :json
    assert_response :success
  end

  test 'should get popular' do
    get popular_url, as: :json
    assert_response :success
  end

  test 'should create image' do
    assert_difference('Image.count') do
      post images_url, params: { image: {
        caption: @image.caption, url: @image.url, user_id: @image.user_id
      } }, as: :json
    end

    assert_response 201
  end

  test 'should show image' do
    get image_url, as: :json
    assert_response :success
  end

  test 'should update image' do
    patch image_url, params: { image: {
      caption: @image.caption, url: @image.url, user_id: @image.user_id
    } }, as: :json
    assert_response 200
  end

  test 'should destroy image' do
    assert_difference('Image.count', -1) do
      delete image_url, as: :json
    end

    assert_response 204
  end

  def image_url
    user_image_url(@user, @image)
  end

  def images_url
    user_images_url(@user)
  end
end
