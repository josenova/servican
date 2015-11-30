class RemoveSurname < ActiveRecord::Migration
  def change
  	remove_column :clients, :surname
  	remove_column :clients, :address
  end
end
