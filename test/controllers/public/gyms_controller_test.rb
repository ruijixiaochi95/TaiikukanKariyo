require "test_helper"

class Public::GymsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_gyms_index_url
    assert_response :success
  end

  test "should get show" do
    get public_gyms_show_url
    assert_response :success
  end
end
