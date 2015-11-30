class CreateBreeds < ActiveRecord::Migration
  def change
    create_table :breeds do |t|

      t.string :name, null:false

      t.references :species, index: true

      t.timestamps null: false
    end
    add_foreign_key :breeds, :species
  end
end
