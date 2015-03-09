module Api
	module V1

		class ChallengersController < ApplicationController
			class Challenger < ::Challenger
			
			end


			respond_to :json

			def index
				respond_with Challenger.all
			end

			def show
				# respond_with Challenger.find_by_name(challenger_params[:name])
				respond_with Challenger.find(params[:id])
			end

			def create
				respond_with Challenger.create(challenger_params[:challenger])
			end

			def update
				respond_with Challenger.update(challenger_params[:id], challenger_params[:challenger])
			end

			def destroy
				respond_with Challenger.destroy(challenger_params[:id])
			end
		end
	end
end
