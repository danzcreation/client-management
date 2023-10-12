require "test_helper"

class OrganizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization = organizations(:one)
    @user = users(:one)

    post sessions_url, params: { email: @user.email, password: "MyString" }
  end

  test "should get index" do
    get organizations_url
    assert_response :success
  end

  test "should get new" do
    get new_organization_url
    assert_response :success
  end

  test "should create organization" do
    assert_difference("Organization.count") do
      post organizations_url, params: { organization: { email: "create.organization@example.com", name: @organization.name, phone: @organization.phone, account_manager_id: @organization.account_manager_id, website: @organization.website } }
    end

    assert_redirected_to organization_url(Organization.last)
  end

  test "should show organization" do
    get organization_url(@organization)
    assert_response :success
  end

  test "should get edit" do
    get edit_organization_url(@organization)
    assert_response :success
  end

  test "should update organization" do
    patch organization_url(@organization), params: { organization: { email: @organization.email, name: @organization.name, phone: @organization.phone, account_manager_id: @organization.account_manager_id, website: @organization.website } }
    assert_redirected_to organization_url(@organization)
  end

  test "should destroy organization" do
    assert_difference("Organization.count", -1) do
      delete organization_url(@organization)
    end

    assert_redirected_to organizations_url
  end
end

class OrganizationsControllerNegativeTest < ActionDispatch::IntegrationTest
  setup do
    @organization = organizations(:one)
    @user = users(:three)

    post sessions_url, params: { email: @user.email, password: "MyString" }
  end

  test "should not get new" do
    get new_organization_url
    assert_redirected_to root_url
  end

  test "should not create organization" do
    assert_no_difference("Organization.count") do
      post organizations_url, params: { organization: { email: "create.organization@example.com", name: @organization.name, phone: @organization.phone, account_manager_id: @organization.account_manager_id, website: @organization.website } }
    end

    assert_redirected_to root_url
  end

  test "should not get edit" do
    get edit_organization_url(@organization)
    assert_redirected_to root_url
  end

  test "should not update organization" do
    patch organization_url(@organization), params: { organization: { email: @organization.email, name: @organization.name, phone: @organization.phone, account_manager_id: @organization.account_manager_id, website: @organization.website } }
    assert_redirected_to root_url
  end

  test "should not destroy organization" do
    assert_no_difference("Organization.count", -1) do
      delete organization_url(@organization)
    end

    assert_redirected_to root_url
  end
end
