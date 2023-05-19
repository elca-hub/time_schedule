require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should not access to user's home page." do
    get "/users/"
    assert_redirected_to "/users/sign_in"
  end
end
