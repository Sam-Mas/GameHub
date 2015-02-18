class ChallengersController < ApplicationController

	# this is the only place where the user does not need a cookie
	skip_before_filter :require_login

	respond_to :html, :js

	def new
		@challenger = Challenger.new
	end

	def create

		@challenger = Challenger.find_by_name(challenger_params[:name])

		unless @challenger
			@challenger = Challenger.new(challenger_params)
			@challenger.save
		end

		cookies[:challenger_id] = @challenger.id
		cookies[:challenger_name] = @challenger.name

		redirect_to root_path

	end

	private 

	def challenger_params
		params.require(:challenger).permit(:name, :balance)
	end

end
