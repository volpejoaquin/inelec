class CreateEntryOrders < ActiveRecord::Migration
  def change
    create_table :entry_orders do |t|
      t.datetime :datetime
      t.integer :number
      t.text :comments

      t.references :client, index: true

      t.timestamps
    end
  end
end
