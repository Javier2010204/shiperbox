require "application_system_test_case"

class ProfilesTest < ApplicationSystemTestCase
  setup do
    @profile = profiles(:one)
  end

  test "visiting the index" do
    visit profiles_url
    assert_selector "h1", text: "Profiles"
  end

  test "creating a Profile" do
    visit profiles_url
    click_on "New Profile"

    fill_in "Address", with: @profile.address
    fill_in "Birthday", with: @profile.birthday
    fill_in "Business name", with: @profile.business_name
    fill_in "Contact name1", with: @profile.contact_name1
    fill_in "Contact name2", with: @profile.contact_name2
    fill_in "Contact phone1", with: @profile.contact_phone1
    fill_in "Contact phone2", with: @profile.contact_phone2
    fill_in "Delivery instructions", with: @profile.delivery_instructions
    fill_in "Name", with: @profile.name
    fill_in "Nit", with: @profile.nit
    fill_in "Phone", with: @profile.phone
    fill_in "Tax residence", with: @profile.tax_residence
    fill_in "User", with: @profile.user_id
    click_on "Create Profile"

    assert_text "Profile was successfully created"
    click_on "Back"
  end

  test "updating a Profile" do
    visit profiles_url
    click_on "Edit", match: :first

    fill_in "Address", with: @profile.address
    fill_in "Birthday", with: @profile.birthday
    fill_in "Business name", with: @profile.business_name
    fill_in "Contact name1", with: @profile.contact_name1
    fill_in "Contact name2", with: @profile.contact_name2
    fill_in "Contact phone1", with: @profile.contact_phone1
    fill_in "Contact phone2", with: @profile.contact_phone2
    fill_in "Delivery instructions", with: @profile.delivery_instructions
    fill_in "Name", with: @profile.name
    fill_in "Nit", with: @profile.nit
    fill_in "Phone", with: @profile.phone
    fill_in "Tax residence", with: @profile.tax_residence
    fill_in "User", with: @profile.user_id
    click_on "Update Profile"

    assert_text "Profile was successfully updated"
    click_on "Back"
  end

  test "destroying a Profile" do
    visit profiles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Profile was successfully destroyed"
  end
end
