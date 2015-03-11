class ChallengersController < ApplicationController

	# this is the only place where the user does not need a cookie
	skip_before_filter :require_login

	respond_to :html, :js

	def challenge_player()
		@issuer = Challenger.find_by_name(params[:challenge_issuer])
		@receiver = Challenger.find_by_name(params[:challenge_receiver])
		
		if (params[:commit] == "No")
			@issuer.opponent = nil
			@issuer.save
		elsif (params[:commit] == "Yes")
			@issuer.opponent = nil
			@issuer.save
			@receiver.opponent = nil
			@receiver.save
			redirect_to "/game/coin_games/#{@receiver.coin_game_id}", status: 301
		else
			@receiver.opponent = @issuer.name
			@receiver.save
			redirect_to "/game/coin_games/new", status: 301
		end
	end	
	
	def new
		@challenger = Challenger.new
	end

	def create
		current_name = cookies[:challenger_name]

		if current_name.include?("Guest")
			guest = Challenger.find_by_name(current_name)
			guest.destroy
		end

		@challenger = Challenger.find_by_name(challenger_params[:name])

		unless @challenger
			@challenger = Challenger.new(challenger_params)
			@challenger.save
		end

		cookies[:challenger_id] = @challenger.id
		cookies[:challenger_name] = @challenger.name

		redirect_to root_path
	end

	def edit
		@challenger = Challenger.find(cookies[:challenger_id]);
	end

    def update
        @challenger = Challenger.find(cookies[:challenger_id])

        if @challenger.update_attributes(challenger_params)
            redirect_to root_path
        else
            render 'edit'
        end
    end

	private 

	def challenger_params
		params.require(:challenger).permit(:name, :balance, :opponent)
	end

end
