require 'test_helper'

class AvailabilitySlotsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get availability_slots_index_url
    assert_response :success
  end

  test "should get show" do
    get availability_slots_show_url
    assert_response :success
  end

  test "should get edit" do
    get availability_slots_edit_url
    assert_response :success
  end

  test "should get update" do
    get availability_slots_update_url
    assert_response :success
  end

  test "should get new" do
    get availability_slots_new_url
    assert_response :success
  end

  test "should get create" do
    get availability_slots_create_url
    assert_response :success
  end

  test "should get destroy" do
    get availability_slots_destroy_url
    assert_response :success
  end

end
