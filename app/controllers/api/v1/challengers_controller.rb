module Api
	module V1

		class ChallengersController < ApplicationController

			# this is the only place where the user does not need a cookie
			skip_before_filter :require_login
		
			protect_from_forgery with: :null_session
			respond_to :json

			def index
				respond_with do |format|
    				format.json { render :json => {:challengers => Challenger.all}}
    			end
			end

			def show
				respond_with Challenger.find(params[:id])
			end

			def create

				@challenger = Challenger.find_by_name(params[:name])
				
				#check is challenger exists
				if @challenger
					puts "Existing Challenger"
				else
					@challenger = Challenger.create(name: params[:name])
					puts "New Challenger"
				end

				respond_with @challenger do |format|
    				format.json { render :json => {:challengers => @challenger}}
    			end
			end

			def update
				challenger = Challenger.find_by_name(params[:name])
				challenger.update(balance: params[:balance])
				respond_with @challenger do |format|
    				format.json { render :json => {:challengers => challenger}}
				end
			end

			def destroy
				respond_with Challenger.destroy(challenger_params[:id])
			end
		end
	end
end
