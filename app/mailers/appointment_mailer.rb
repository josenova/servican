class AppointmentMailer < ApplicationMailer

	def reminder_email(appointment)
		@appointment = appointment
		@client = appointment.patient.client
		@patient = appointment.patient

		mail(to: @client.email, subject: ['Cita para ' + @patient.name] )
	end
end
