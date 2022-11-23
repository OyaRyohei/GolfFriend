require "test_helper"

class Admin::GolfSpotsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_golf_spots_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_golf_spots_edit_url
    assert_response :success
  end
end
