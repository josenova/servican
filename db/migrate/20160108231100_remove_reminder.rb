class RemoveReminder < ActiveRecord::Migration
  def change
  	remove_column :appointments, :reminder, :date
  end
end
