class AddReminderToAppointment < ActiveRecord::Migration
  def change
  	add_column :appointments, :reminder, :date
  end
end
