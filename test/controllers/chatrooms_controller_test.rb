require 'test_helper'

class helpchatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @helpchat = helpchats(:one)
  end

  test "should get index" do
    get helpchats_url
    assert_response :success
  end

  test "should get new" do
    get new_helpchat_url
    assert_response :success
  end

  test "should create helpchat" do
    assert_difference('helpchat.count') do
      post helpchats_url, params: { helpchat: { name: @helpchat.name } }
    end

    assert_redirected_to helpchat_url(helpchat.last)
  end

  test "should show helpchat" do
    get helpchat_url(@helpchat)
    assert_response :success
  end

  test "should get edit" do
    get edit_helpchat_url(@helpchat)
    assert_response :success
  end

  test "should update helpchat" do
    patch helpchat_url(@helpchat), params: { helpchat: { name: @helpchat.name } }
    assert_redirected_to helpchat_url(@helpchat)
  end

  test "should destroy helpchat" do
    assert_difference('helpchat.count', -1) do
      delete helpchat_url(@helpchat)
    end

    assert_redirected_to helpchats_url
  end
end
