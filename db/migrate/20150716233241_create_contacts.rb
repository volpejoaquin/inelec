class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :lastname
      t.string :phone
      t.string :email
      t.string :charge
      t.integer :client_id

      t.timestamps
    end
  end
end
