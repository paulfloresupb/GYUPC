json.extract! contacto, :id, :nombre_contact, :apellido_contact, :email_contact, :telef_contact, :consulta_contact, :created_at, :updated_at
json.url contacto_url(contacto, format: :json)
