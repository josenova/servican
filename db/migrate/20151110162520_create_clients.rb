class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|

      t.string :name, null: false
      t.string :surname, null: false
      t.string :email
      t.string :phone
      t.string :cellphone
      t.string :address

      t.timestamps null: false
    end
  end
end
