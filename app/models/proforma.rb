class Proforma < ApplicationRecord
  validates :no_cliente, presence: {
      message: "es requerido"
  }
  validates :nu_dni, presence: {
      message: "es requerido"
  }, length: {
      minimum: 8,
      too_short: "debe tener 8 digitos"
  }, uniqueness: {
      message: "Ya esta requistrado"
  }
  validates :email_cliente, presence: {
      message: "es requerido"
  }, uniqueness: {
      message: "Ya esta registrado",
      case_sensitive: false
  }
  validates :nu_celular, presence: {
      message: "es requerido"
  },length: {
      minimum: 9,
      too_short: "debe tener mas de 9 digitos"
  }
  validates :no_proyecto, presence: {
      message: "es requerido"
  }
  validates :numero_piso, presence: {
      message: "es requerido"
  }, numericality: { only_integer: true}
  validates :costo_m2, presence: {
      message: "es requerido"
  }, numericality: { only_float: true}
end
