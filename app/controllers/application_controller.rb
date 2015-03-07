class ApplicationController < ActionController::Base
	
        @@guest_num = 1

	# This forces users to the login page
        before_filter :require_account, :display_challengers
	
	protect_from_forgery with: :exception
	
	private

	def display_challengers
		@challengers = Challenger.all
	end

        def require_account
                # Creates a temporary Guest account for the user
                unless cookies[:challenger_name]
                        @challenger = Challenger.new
                        @challenger.name = "Guest" + @@guest_num.to_s
                        @challenger.save!

                        cookies[:challenger_id] = @challenger.id
                        cookies[:challenger_name] = @challenger.name

                        @@guest_num += 1
                end
        end

end
