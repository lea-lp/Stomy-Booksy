require 'test_helper'

class EstablishmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get establishments_show_url
    assert_response :success
  end

  test "should get edit" do
    get establishments_edit_url
    assert_response :success
  end

end
