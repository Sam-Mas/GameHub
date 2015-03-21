class ApplicationController < ActionController::Base

	# This forces users to the login page
        before_filter :require_account, :display_challengers
	
	protect_from_forgery with: :exception
	
	private

	def display_challengers
                @challengers = Challenger.all.order(:name)
                @other_challengers = @challengers.find_all { |challenger| challenger.id != cookies[:challenger_id].to_i }
                @myself = Challenger.find_by_name(cookies[:challenger_name])
	end

        def require_account
                unless Challenger.exists?(name: cookies[:challenger_name]) 
                        cookies[:challenger_name] = nil
                        cookies[:challenger_id] = nil
                end

                unless cookies[:challenger_name]
                        @challenger = Challenger.create_guest

                        cookies[:challenger_name] = @challenger.name
                        cookies[:challenger_id] = @challenger.id
                end
        end

end
