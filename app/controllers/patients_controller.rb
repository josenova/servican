class PatientsController < ApplicationController

	before_action :authenticate_admin!
	before_action :set_example, only: [:show, :edit, :update, :destroy]

	# Index search query results
	def index
    end


	def new
	end


	def create
		@patient = Patient.new(patient_params)
		respond_to do |format|
			if @patient.save
				format.json { render :show, status: :created, location: @patient }
			else
			format.json { render json: @patient.errors, status: :unprocessable_entity }
			logger.warn "Patient could not be created: #{@patient.attributes.inspect}, is valid?: #{@patient.valid?}"
			end
	    end
	end


	def show
		render json: @patient
	end

	def update
    end


  private

    # Use callbacks to share common setup or constraints between actions.
	def set_example
	  @patient = Patient.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def patient_params
	params.require(:patient).permit(:name, :gender)
	end


end
