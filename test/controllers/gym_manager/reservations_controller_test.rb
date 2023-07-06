require "test_helper"

class GymManager::ReservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gym_manager_reservations_index_url
    assert_response :success
  end

  test "should get show" do
    get gym_manager_reservations_show_url
    assert_response :success
  end
end
