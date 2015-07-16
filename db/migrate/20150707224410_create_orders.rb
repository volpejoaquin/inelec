class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :number
      t.datetime :start_date
      t.text :comment
      t.integer :client_id

      t.timestamps
    end
  end
end
