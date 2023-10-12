require "application_system_test_case"

class OrganizationsTest < ApplicationSystemTestCase
  setup do
    @organization = organizations(:one)
  end

  test "visiting the index" do
    visit organizations_url
    assert_selector "h1", text: "Organizations"
  end

  test "should create organization" do
    visit organizations_url
    click_on "New organization"

    fill_in "Email", with: @organization.email
    fill_in "Name", with: @organization.name
    fill_in "Phone", with: @organization.phone
    fill_in "User", with: @organization.user_id
    fill_in "Website", with: @organization.website
    click_on "Create Organization"

    assert_text "Organization was successfully created"
    click_on "Back"
  end

  test "should update Organization" do
    visit organization_url(@organization)
    click_on "Edit this organization", match: :first

    fill_in "Email", with: @organization.email
    fill_in "Name", with: @organization.name
    fill_in "Phone", with: @organization.phone
    fill_in "User", with: @organization.user_id
    fill_in "Website", with: @organization.website
    click_on "Update Organization"

    assert_text "Organization was successfully updated"
    click_on "Back"
  end

  test "should destroy Organization" do
    visit organization_url(@organization)
    click_on "Destroy this organization", match: :first

    assert_text "Organization was successfully destroyed"
  end
end