require "test_helper"

class GymManager::FacilitysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gym_manager_facilitys_index_url
    assert_response :success
  end

  test "should get edit" do
    get gym_manager_facilitys_edit_url
    assert_response :success
  end
end
