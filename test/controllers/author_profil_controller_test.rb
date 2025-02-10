require "test_helper"

class AuthorProfilControllerTest < ActionDispatch::IntegrationTest
  test "should get profil" do
    get author_profil_profil_url
    assert_response :success
  end
end
