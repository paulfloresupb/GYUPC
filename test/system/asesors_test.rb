require "application_system_test_case"

class AsesorsTest < ApplicationSystemTestCase
  setup do
    @asesor = asesors(:one)
  end

  test "visiting the index" do
    visit asesors_url
    assert_selector "h1", text: "Asesors"
  end

  test "creating a Asesor" do
    visit asesors_url
    click_on "New Asesor"

    fill_in "Apellido", with: @asesor.apellido
    fill_in "Nombre", with: @asesor.nombre
    fill_in "Password", with: @asesor.password
    fill_in "User", with: @asesor.user
    click_on "Create Asesor"

    assert_text "Asesor was successfully created"
    click_on "Back"
  end

  test "updating a Asesor" do
    visit asesors_url
    click_on "Edit", match: :first

    fill_in "Apellido", with: @asesor.apellido
    fill_in "Nombre", with: @asesor.nombre
    fill_in "Password", with: @asesor.password
    fill_in "User", with: @asesor.user
    click_on "Update Asesor"

    assert_text "Asesor was successfully updated"
    click_on "Back"
  end

  test "destroying a Asesor" do
    visit asesors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Asesor was successfully destroyed"
  end
end
