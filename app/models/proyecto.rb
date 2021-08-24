class Proyecto < ApplicationRecord
	has_many_attached :foto_proy
	has_many :departamentos
	#mount_uploaders :foto_proy, FotoproyUploader

	validates :nombre_proy, presence: {
		message: "es requerido"
	}

	validates :ubicacion_proy, presence: {
		message: "es requerido"
	}
	validates :precio_base, presence: {
		message: "es requerido"
	}

	validates :foto_proy, presence: {
		message: "es requerido"
	}

end
