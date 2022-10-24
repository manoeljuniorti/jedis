class CreateEnderecos < ActiveRecord::Migration[5.2]
  def change
    create_table :enderecos do |t|
      t.string :cep
      t.string :address
      t.string :complement
      t.string :district
      t.string :city
      t.string :state
      t.string :ibge_cod
      t.references :municipes

      t.timestamps
    end
  end
end
