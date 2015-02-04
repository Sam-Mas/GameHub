class OnlineChallengerListController < ApplicationController

	

	def setup
		online_challengers = Array.new
	end

	def add (challengerName)
		online_challengers.push(challengerName) 
		# need to put parameter here 
	end

	def remove (challenegerName)
		online_challengers.delete(challenegerName)
	end

	def show

	end


end
