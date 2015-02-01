class ChallengersController < ApplicationController

	before_action :all_challengers, only: [:index, :create]
	respond_to :html, :js

	def new
		@challenger = Challenger.new
	end

	def create
		@challenger = Challenger.create(challenger_params)
	end

	private 

	def all_challengers
		@challengers = Challenger.all
	end

	def challenger_params
		params.require(:challenger).permit(:name)
	end

end
