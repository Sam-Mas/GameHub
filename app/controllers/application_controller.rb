class ApplicationController < ActionController::Base
	
        @@guest_num = 1
        @@hasRun = false

	# This forces users to the login page
        before_filter :require_account, :display_challengers
	
	protect_from_forgery with: :exception
	
	private

	def display_challengers
		@challengers = Challenger.all
	end

        def require_account
                unless @@hasRun
                        # Creates a temporary Guest account for the userc
                        if cookies[:challenger_name]
                                @@hasRun
                                name = Challenger.find_by_name(cookies[:challenger_name])

                                unless name 
                                        create_guest()
                                end
                        else 
                                @@hasRun
                                create_guest()
                        end
                end
        end

        def create_guest
                @challenger = Challenger.new
                @challenger.name = "Guest" + @@guest_num.to_s
                @challenger.save!

                cookies[:challenger_id] = @challenger.id
                cookies[:challenger_name] = @challenger.name

                @@guest_num += 1
        end

end
