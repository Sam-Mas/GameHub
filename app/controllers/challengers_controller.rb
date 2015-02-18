class ChallengersController < ApplicationController

	respond_to :html, :js

	def new
		@challenger = Challenger.new
	end

	def index
		@challengers = Challenger.all
	end 

	def create
		# puts challenger_params
		@challenger = Challenger.new(challenger_params)
		puts @challenger.name
		
		if Challenger.find_by name: @challenger.name
			# log in 
			# flash[:notice] = "Logged into existing user"
			
			# redirect_to challenger_url(@challenger)
			
		else
			
			@challenger = Challenger.create(challenger_params)
			if @challenger.save
				# flash[:notice] = "User Created"
				# redirect_to challenger_url(@challenger)
				

			else
				# flash[:notice] = "Could not create Users"
				# redirect_to new_challenger_url
							

			end

		end
		
		# respond_to do |format|
		# 	format: "js"
		# 	format: "html"
		# end
		
	end

	def show
		@challenger.name
	end

	private 

	def all_challengers
		@challengers = Challenger.all
	end

	def challenger_params
		params.require(:challenger).permit(:name, :balance)
	end

end
