class ApplicationController < ActionController::Base
	
	# This forces users to the login page
	before_filter :require_login, :display_challengers
	
	protect_from_forgery with: :exception
	
	private

	def display_challengers
		@challengers = Challenger.all
		gon.watch.active_users
	end

	def require_login
		unless cookies[:challenger_name]
			redirect_to url_for(controller: "/challengers",
					    action: "new",) and return 
			
		end
	end
end
