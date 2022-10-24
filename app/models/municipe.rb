class Municipe < ApplicationRecord
  validates_presence_of :name, :cpf, :cns, :email, :birth_date, :phone, :photo, :status

  validates :my_email_attribute, email: true
end
