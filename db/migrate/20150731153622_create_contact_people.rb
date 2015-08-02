class CreateContactPeople < ActiveRecord::Migration
  def change
    create_table :contact_people do |t|
      t.string :name
      t.string :phone
      t.string :position
      t.string :email
      t.boolean :decision_maker

      t.references :client, index: true

      t.timestamps
    end
  end
end
