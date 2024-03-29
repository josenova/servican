class ClientsController < ApplicationController

# This whole controller works as an internal API for json only requests to the action routes.

before_action :authenticate_admin!
before_action :set_client, only: [:show, :update, :destroy]

	# Index search query results
	def index
		query = params[:name]
    	@clients = Client.ci_where('name', query)
    	render json: @clients
    end


	def new
		#@client = Client.new
	end


	def create
		@client = Client.new(client_params)
		respond_to do |format|
			if @client.save
				format.json { render :json => { status: :ok, :message => "Success!"}, status: :created }
			else
			format.json { render json: @client.errors, status: :unprocessable_entity }
			logger.warn "Client could not be created: #{@client.attributes.inspect}, is valid?: #{@client.valid?}"
			end
	    end
	end


	def show
		render json: @client.to_json( :include => { :patients => { :include => { 
			:breed => { :only => :name }, 
			:appointments => { :only => :date } 
			} } } )
	end

	def update
	    respond_to do |format|
	      if @client.update(client_params)
	        format.json { render :json => { status: :ok, :message => "Success" } }
	      else
	        format.json {  }
	      end
	    end
    end


  private

    # Use callbacks to share common setup or constraints between actions.
	def set_client
	  @client = Client.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def client_params
	params.permit(:name, :email, :phone, :cellphone)
	end



end
