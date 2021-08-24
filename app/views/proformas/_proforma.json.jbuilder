json.extract! proforma, :id, :no_cliente, :nu_dni, :nu_celular, :email_cliente,
              :no_proyecto, :numero_piso, :costo_m2, :area_total, :created_at, :updated_at
json.url proforma_url(proforma, format: :json)
