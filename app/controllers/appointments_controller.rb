class AppointmentsController < ApplicationController

	before_action :authenticate_admin!
	before_action :set_appointment, only: [:destroy]



	def index
	end


	def new
	end


	def create
		@appointment = Appointment.new(appointment_params)
		respond_to do |format|
			if @appointment.save
				format.json { render :json => { status: :ok, :message => "Success!"}, status: :created }
			else
			format.json { render json: @appointment.errors, status: :unprocessable_entity }
			logger.warn "Appointment could not be created: #{@appointment.attributes.inspect}, is valid?: #{@appointment.valid?}"
			end
	    end
	end


  # DELETE /lols/1
  # DELETE /lols/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

	private

    # Use callbacks to share common setup or constraints between actions.
	def set_appointment
	  @appointment = Appointment.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def appointment_params
	params.permit(:date, :reason, :patient_id)
	end


end
