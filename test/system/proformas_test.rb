require "application_system_test_case"

class ProformasTest < ApplicationSystemTestCase
  setup do
    @proforma = proformas(:one)
  end

  test "visiting the index" do
    visit proformas_url
    assert_selector "h1", text: "Proformas"
  end

  test "creating a Proforma" do
    visit proformas_url
    click_on "New Proforma"

    fill_in "Area total", with: @proforma.area_total
    fill_in "Costo m2", with: @proforma.costo_m2
    fill_in "Email cliente", with: @proforma.email_cliente
    fill_in "No cliente", with: @proforma.no_cliente
    fill_in "No proyecto", with: @proforma.no_proyecto
    fill_in "Nu celular", with: @proforma.nu_celular
    fill_in "Nu dni", with: @proforma.nu_dni
    fill_in "Numero piso", with: @proforma.numero_piso
    click_on "Create Proforma"

    assert_text "Proforma was successfully created"
    click_on "Back"
  end

  test "updating a Proforma" do
    visit proformas_url
    click_on "Edit", match: :first

    fill_in "Area total", with: @proforma.area_total
    fill_in "Costo m2", with: @proforma.costo_m2
    fill_in "Email cliente", with: @proforma.email_cliente
    fill_in "No cliente", with: @proforma.no_cliente
    fill_in "No proyecto", with: @proforma.no_proyecto
    fill_in "Nu celular", with: @proforma.nu_celular
    fill_in "Nu dni", with: @proforma.nu_dni
    fill_in "Numero piso", with: @proforma.numero_piso
    click_on "Update Proforma"

    assert_text "Proforma was successfully updated"
    click_on "Back"
  end

  test "destroying a Proforma" do
    visit proformas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Proforma was successfully destroyed"
  end
end
