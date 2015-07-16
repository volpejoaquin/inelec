class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :address
      t.string :city
      t.integer :category_id
      t.integer :postal_code
      t.string :phone
      t.string :email
      t.string :cuit

      t.timestamps
    end
  end
end
