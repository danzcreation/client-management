require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should redirect login" do
    get login_url
    assert_response :success
  end

  test "should get index" do
    @user = users(:one)
    post sessions_url, params: { email: @user.email, password: "MyString" }

    get home_index_url
    assert_response :success
  end
end
