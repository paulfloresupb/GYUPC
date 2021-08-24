class Departamento < ApplicationRecord
	has_many_attached :foto_dep
	#mount_uploaders :foto_dep, FotoproyUploader
	belongs_to :proyecto

		validates :nombre_dep, presence: {
		message: "es requerido"
	}

	validates :piso_dep, presence: {
		message: "es requerido"
	}
	validates :area, presence: {
		message: "es requerido"
	}

	validates :nro_habitacion, presence: {
		message: "es requerido"
	}

	validates :foto_dep, presence: {
		message: "es requerido"
	}

end
