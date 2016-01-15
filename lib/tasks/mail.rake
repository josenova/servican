namespace :mail do

  desc "Mail 3 day ahead reminders"
  task pre_reminder: :environment do

    @appointments = Appointment.where("appointments.date = ?", Date.today + 3)
    puts @appointments
  	
  	end

end

