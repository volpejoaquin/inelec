class CreateTransformers < ActiveRecord::Migration
  def change
    create_table :transformers do |t|
      t.string :mark
      t.string :power
      t.string :number
      t.integer :record_id
      t.integer :diagnostic
      t.text :comments
      t.integer :entry_order_id
      t.integer :exit_order_id

      t.timestamps
    end
  end
end
