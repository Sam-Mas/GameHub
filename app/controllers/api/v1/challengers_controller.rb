module Api
	module V1
		# render :json => {:challengers => @challengers}

		class ChallengersController < ApplicationController
		


			protect_from_forgery with: :null_session
			respond_to :json


			def index
				#respond_with render :json => {:challengers => @challengers}
				# respond_with Challenger.all

				respond_with Challenger.all do |format|
    				format.json { render :json => {:challengers => Challenger.all}}
    			end


    			#test for the create method ( to be able to use the brosers GET)
				# @challenger = Challenger.find_by_name("Dave")
				# #check is challenger exists
				# if @challenger
				# 	puts "Exsiting Challenger"
				# else
				# 	@challenger = Challenger.new(params[:name])
				# 	puts "New Challenger"
				# end

				# render :json => {:challengers => @challengers}
				#respond_with @challenger

				# respond_with @challenger do |format|
    # 				format.json { render :json => {:challengers => @challenger}}
    # 			end

			end

			def show
				debugger
				# render :json => {:challengers => @challengers}
				# respond_with Challenger.find_by_name(challenger_params[:name])
				respond_with Challenger.find(params[:id])
			end

			def create
				 debugger

				@challenger = Challenger.find_by_name(params[:name])
				#check is challenger exists
				if @challenger
					puts "Existing Challenger"
				else
					@challenger = Challenger.create(name: params[:name])
					puts "New Challenger"
				end

				# render :json => {:challengers => @challengers}
				#respond_with @challenger

			

				respond_with @challenger do |format|
    				format.json { render :json => {:challengers => @challenger}}
    			end
			end

			def update
				debugger
				challenger = Challenger.find_by_name(params[:name])
				challenger.update(balance: params[:balance])
				respond_with @challenger do |format|
    				format.json { render :json => {:challengers => challenger}}
				end
			end

			def destroy
				debugger
				respond_with Challenger.destroy(challenger_params[:id])
			end
		end
	end
end
