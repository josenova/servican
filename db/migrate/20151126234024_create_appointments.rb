class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|

      t.date :date

      t.references :patient, index: true

      t.timestamps null: false
    end
    add_foreign_key :appointments, :patients
  end
end
