class Contacto < ApplicationRecord
		validates :nombre_contact, presence: {
		message: "es requerido"
	}

	validates :apellido_contact, presence: {
		message: "es requerido"
	}
	
	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	validates :email_contact, 		:presence => true,
							:format => EMAIL_REGEX

	validates :telef_contact, presence: {
		message: "es requerido"
	}

	validates :consulta_contact, presence: {
		message: "es requerido"
	}

end
