class CreateEntryOrders < ActiveRecord::Migration
  def change
    create_table :entry_orders do |t|
      t.datetime :date
      t.integer :number
      t.integer :client_id
      t.text :comments

      t.timestamps
    end
  end
end
