class CreateTransformers < ActiveRecord::Migration
  def change
    create_table :transformers do |t|
      t.string :mark
      t.string :power
      t.string :number
      t.integer :diagnostic
      t.text :comments

      # t.references :record, index: true
      t.references :entry_order, index: true
      # t.references :exit_order, index: true

      t.timestamps
    end
  end
end
