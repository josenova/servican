class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|

      t.string :name, null: false
      t.boolean :gender
      t.date :birthdate

      t.references :client, index: true
      t.references :breed, index: true

      t.timestamps null: false
    end
    add_foreign_key :patients, :clients
    add_foreign_key :patients, :breeds
  end
end
