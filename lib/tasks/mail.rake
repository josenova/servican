namespace :mail do

  desc "Mail 3 day ahead reminders"
  task pre_reminder: :environment do

    @appointments = Appointment.where("appointments.date = ?", Date.today + 3)
    puts @appointments
    @appointments.each do |a|
    	AppointmentMailer.reminder_email(a).deliver_later
  	end
  	

  	end

end

