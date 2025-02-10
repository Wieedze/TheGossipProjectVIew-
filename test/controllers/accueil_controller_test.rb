require "test_helper"

class AcceuilControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get acceuil_home_url
    assert_response :success
  end
end
