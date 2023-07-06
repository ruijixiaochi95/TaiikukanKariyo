require "test_helper"

class Admin::GymManagersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_gym_managers_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_gym_managers_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_gym_managers_edit_url
    assert_response :success
  end
end
