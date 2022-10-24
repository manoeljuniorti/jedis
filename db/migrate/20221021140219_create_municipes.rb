class CreateMunicipes < ActiveRecord::Migration[5.2]
  def change
    create_table :municipes do |t|
      t.string :name
      t.string :cpf
      t.integer :cns
      t.string :email
      t.date :birth_date
      t.string :phone
      t.string :photo
      t.boolean :status

      t.timestamps
    end
  end
end
