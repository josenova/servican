class AdminsController < ApplicationController

before_action :authenticate_admin!


	def clients
	end

	def appointments
		@appointments = Appointment.all
	end


end
