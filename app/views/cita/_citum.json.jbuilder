json.extract! citum, :id, :dni, :nombre, :apellido, :correo, :telefono,
              :fechaCita, :horaCita, :estado_id, :asesor_id, :created_at, :updated_at
json.url citum_url(citum, format: :json)
