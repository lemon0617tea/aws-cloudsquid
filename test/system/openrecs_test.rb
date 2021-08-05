require "application_system_test_case"

class OpenrecsTest < ApplicationSystemTestCase
  setup do
    @openrec = openrecs(:one)
  end

  test "visiting the index" do
    visit openrecs_url
    assert_selector "h1", text: "Openrecs"
  end

  test "creating a Openrec" do
    visit openrecs_url
    click_on "New Openrec"

    fill_in "Body", with: @openrec.body
    fill_in "Name", with: @openrec.name
    fill_in "Openrec url", with: @openrec.openrec_url
    fill_in "User", with: @openrec.user_id
    click_on "Create Openrec"

    assert_text "Openrec was successfully created"
    click_on "Back"
  end

  test "updating a Openrec" do
    visit openrecs_url
    click_on "Edit", match: :first

    fill_in "Body", with: @openrec.body
    fill_in "Name", with: @openrec.name
    fill_in "Openrec url", with: @openrec.openrec_url
    fill_in "User", with: @openrec.user_id
    click_on "Update Openrec"

    assert_text "Openrec was successfully updated"
    click_on "Back"
  end

  test "destroying a Openrec" do
    visit openrecs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Openrec was successfully destroyed"
  end
end
