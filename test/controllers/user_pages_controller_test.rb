require 'test_helper'

class UserPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show_profile" do
    get user_pages_show_profile_url
    assert_response :success
  end

  test "should get edit_profile" do
    get user_pages_edit_profile_url
    assert_response :success
  end

  test "should get dashboard" do
    get user_pages_dashboard_url
    assert_response :success
  end

end
