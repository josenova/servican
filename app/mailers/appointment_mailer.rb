class AppointmentMailer < ApplicationMailer

	def reminder_email(appointment)
		@client = appointment.client
		@patient = appointment.patient

		mail(to: @client.email, subject: 'Recordatorio de Cita')
	end
end
