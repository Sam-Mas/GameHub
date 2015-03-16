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

	def sign_out
		cookies[:challenger_id] = nil
		cookies[:challenger_name] = nil
		redirect_to root_path
	end
	
	def new
		debugger
		@challenger = Challenger.new
	end

	def create
		debugger
		@challenger = Challenger.find_by_name(challenger_params[:name])
		
		# if the challenger already exists
		if @challenger 
			
			flash[:danger] = nil
			flash[:notice] = 'challenger successfully loaded'
			set_cookies(@challenger)
			redirect_to root_path

		# try to create the user
		else
			@challenger = Challenger.new(challenger_params)

			# on success
			if @challenger.save

				flash[:danger] = nil
				flash[:notice] = 'new challenger created'
				set_cookies(@challenger)
				redirect_to root_path

			# on failure, ask for another name
			else
				flash[:danger] = 'Invalid username, please only user letters and numbers'
				render 'new'
			end
		end

	end

	def edit
		debugger
		@challenger = Challenger.find(cookies[:challenger_id]);
	end

	def update
		debugger
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

	def set_cookies(challenger)
		cookies[:challenger_id] = challenger.id
		cookies[:challenger_name] = challenger.name
	end

end
