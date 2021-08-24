require 'test_helper'

class ContactosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contacto = contactos(:one)
  end

  test "should get index" do
    get contactos_url
    assert_response :success
  end

  test "should get new" do
    get new_contacto_url
    assert_response :success
  end

  test "should create contacto" do
    assert_difference('Contacto.count') do
      post contactos_url, params: { contacto: { apellido_contact: @contacto.apellido_contact, consulta_contact: @contacto.consulta_contact, email_contact: @contacto.email_contact, nombre_contact: @contacto.nombre_contact, telef_contact: @contacto.telef_contact } }
    end

    assert_redirected_to contacto_url(Contacto.last)
  end

  test "should show contacto" do
    get contacto_url(@contacto)
    assert_response :success
  end

  test "should get edit" do
    get edit_contacto_url(@contacto)
    assert_response :success
  end

  test "should update contacto" do
    patch contacto_url(@contacto), params: { contacto: { apellido_contact: @contacto.apellido_contact, consulta_contact: @contacto.consulta_contact, email_contact: @contacto.email_contact, nombre_contact: @contacto.nombre_contact, telef_contact: @contacto.telef_contact } }
    assert_redirected_to contacto_url(@contacto)
  end

  test "should destroy contacto" do
    assert_difference('Contacto.count', -1) do
      delete contacto_url(@contacto)
    end

    assert_redirected_to contactos_url
  end
end
