class CreateExitOrders < ActiveRecord::Migration
  def change
    create_table :exit_orders do |t|
      t.datetime :date
      t.integer :number
      t.integer :client_id
      t.text :comments

      t.references :client, index: true

      t.timestamps
    end
  end
end
