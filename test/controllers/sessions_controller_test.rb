require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should login" do
    post sessions_url, params: { email: @user.email, password: "MyString" }
    assert_redirected_to root_url
  end

  test "should logout" do
    delete sessions_url
    assert_redirected_to login_url
  end
end
