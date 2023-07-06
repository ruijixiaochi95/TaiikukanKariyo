require "test_helper"

class Admin::GymsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_gyms_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_gyms_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_gyms_edit_url
    assert_response :success
  end
end
