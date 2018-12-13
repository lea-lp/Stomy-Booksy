require 'test_helper'

class ServicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get services_index_url
    assert_response :success
  end

  test "should get show" do
    get services_show_url
    assert_response :success
  end

end
