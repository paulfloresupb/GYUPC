require "application_system_test_case"

class ContactosTest < ApplicationSystemTestCase
  setup do
    @contacto = contactos(:one)
  end

  test "visiting the index" do
    visit contactos_url
    assert_selector "h1", text: "Contactos"
  end

  test "creating a Contacto" do
    visit contactos_url
    click_on "New Contacto"

    fill_in "Apellido contact", with: @contacto.apellido_contact
    fill_in "Consulta contact", with: @contacto.consulta_contact
    fill_in "Email contact", with: @contacto.email_contact
    fill_in "Nombre contact", with: @contacto.nombre_contact
    fill_in "Telef contact", with: @contacto.telef_contact
    click_on "Create Contacto"

    assert_text "Contacto was successfully created"
    click_on "Back"
  end

  test "updating a Contacto" do
    visit contactos_url
    click_on "Edit", match: :first

    fill_in "Apellido contact", with: @contacto.apellido_contact
    fill_in "Consulta contact", with: @contacto.consulta_contact
    fill_in "Email contact", with: @contacto.email_contact
    fill_in "Nombre contact", with: @contacto.nombre_contact
    fill_in "Telef contact", with: @contacto.telef_contact
    click_on "Update Contacto"

    assert_text "Contacto was successfully updated"
    click_on "Back"
  end

  test "destroying a Contacto" do
    visit contactos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contacto was successfully destroyed"
  end
end
