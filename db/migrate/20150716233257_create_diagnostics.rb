class CreateDiagnostics < ActiveRecord::Migration
  def change
    create_table :diagnostics do |t|
      t.datetime :date
      t.text :comments

      t.references :transformer, index: true

      t.timestamps
    end
  end
end
