class CreateDiagnostics < ActiveRecord::Migration
  def change
    create_table :diagnostics do |t|
      t.datetime :date
      t.text :comments
      t.integer :transformer_id

      t.timestamps
    end
  end
end
