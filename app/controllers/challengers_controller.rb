class ChallengersController < ApplicationController

	respond_to :html, :js

	def new
		@challenger = Challenger.new
	end

	def index
		@challengers = Challenger.all
	end

	def create
		@challenger = Challenger.create(challenger_params)
	
		respond_to do |format|
			format.js 
		end
	end

	def show
		@challenger.name
	end

	private 

	def all_challengers
		@challengers = Challenger.all
	end

	def challenger_params
		params.require(:challenger).permit(:name)
	end

end
