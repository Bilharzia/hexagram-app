require "test_helper"

class HiveControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get hive_show_url
    assert_response :success
  end
end
