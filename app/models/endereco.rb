class Endereco < ApplicationRecord
  belongs_to :municipe

  validates_presence_of :cep, :address, :complement, :district, :city, :state
end
