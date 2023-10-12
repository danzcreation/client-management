require "test_helper"

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization = organizations(:one)
    @person = people(:one)
    @user = users(:one)
    post sessions_url, params: { email: @user.email, password: "MyString" }
  end

  test "should get new" do
    get new_organization_person_url(@organization)
    assert_response :success
  end

  test "should create person" do
    assert_difference("Person.count") do
      post organization_people_url(@organization), params: { person: { email: @person.email, name: @person.name, organization_id: @person.organization_id, phone: @person.phone } }
    end

    assert_redirected_to organization_url(Person.last.organization)
  end

  test "should show person" do
    get organization_person_url(@person.organization, @person)
    assert_response :success
  end

  test "should get edit" do
    get edit_organization_person_url(@person.organization, @person)
    assert_response :success
  end

  test "should update person" do
    patch organization_person_url(@person.organization, @person), params: { person: { email: @person.email, name: @person.name, organization_id: @person.organization_id, phone: @person.phone } }
    assert_redirected_to organization_url(@person.organization)
  end

  test "should destroy person" do
    assert_difference("Person.count", -1) do
      delete organization_person_url(@person.organization, @person)
    end

    assert_redirected_to organization_url(@person.organization)
  end
end

class PeopleControllerNegativeTest < ActionDispatch::IntegrationTest
  setup do
    @organization = organizations(:one)
    @person = people(:one)
    @user = users(:three)
    post sessions_url, params: { email: @user.email, password: "MyString" }
  end

  test "should not get new" do
    get new_organization_person_url(@organization)
    assert_redirected_to root_url
  end

  test "should not create person" do
    assert_no_difference("Person.count") do
      post organization_people_url(@organization), params: { person: { email: @person.email, name: @person.name, organization_id: @person.organization_id, phone: @person.phone } }
    end

    assert_redirected_to root_url
  end

  test "should not get edit" do
    get edit_organization_person_url(@person.organization, @person)
    assert_redirected_to root_url
  end

  test "should not update person" do
    patch organization_person_url(@person.organization, @person), params: { person: { email: @person.email, name: @person.name, organization_id: @person.organization_id, phone: @person.phone } }
    assert_redirected_to root_url
  end

  test "should not destroy person" do
    assert_no_difference("Person.count", -1) do
      delete organization_person_url(@person.organization, @person)
    end

    assert_redirected_to root_url
  end
end