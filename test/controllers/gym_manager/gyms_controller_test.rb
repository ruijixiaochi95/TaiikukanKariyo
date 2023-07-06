require "test_helper"

class GymManager::GymsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get gym_manager_gyms_new_url
    assert_response :success
  end

  test "should get index" do
    get gym_manager_gyms_index_url
    assert_response :success
  end

  test "should get show" do
    get gym_manager_gyms_show_url
    assert_response :success
  end

  test "should get edit" do
    get gym_manager_gyms_edit_url
    assert_response :success
  end
end
