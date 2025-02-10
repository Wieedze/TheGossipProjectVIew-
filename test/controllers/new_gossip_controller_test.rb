require "test_helper"

class NewGossipControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get new_gossip_create_url
    assert_response :success
  end
end
