class AppointmentMailer < ApplicationMailer

	def reminder_email(appointment)
		@address = appointment.client.email
		mail(to: @address, subject: 'Recordatorio de Cita')
	end
end
