class Game::CoinGamesController < ApplicationController
	before_action :set_game_coin_game, only: [:show, :edit, :update, :destroy]

	# GET /game/coin_games
	# GET /game/coin_games.json
	def index
		@game_coin_games = Game::CoinGame.all
		@coin_games_full = Game::CoinGame.all.find_all { |g| g.challengers.count == 2 }
		@coin_games_need_another_player = Game::CoinGame.all.find_all { |g| g.challengers.count == 1 }
	end

	# GET /game/coin_games/1
	# GET /game/coin_games/1.json
	def show

		@game = Game::CoinGame.find(params[:id])

		if @game.challengers.count == 0 || (@game.challengers.count < Game::CoinGame.MAX_SIZE && @game.challengers.first.id != cookies[:challenger_id].to_i)
			@game.challengers << Challenger.find(cookies[:challenger_id])
			@game.save
		end
		
		@other_challenger = @game.challengers.find { |c| c.id != cookies[:challenger_id].to_i }

		@my_score = @game.get_score_for(cookies[:challenger_id].to_i)
		gon.watch.my_score = @my_score

		if @other_challenger
			@opponents_score = @game.get_score_for(@other_challenger.id)
			gon.watch.opponents_score = @opponents_score
		else
			@opponents_score = 0
			gon.watch.opponents_score = 0
		end
	end

	# GET /game/coin_games/new
	def new
		@game = Game::CoinGame.new
		@game.score1 = 0
		@game.score2 = 0
		@game.challengers << Challenger.find(cookies[:challenger_id])
		@game.save

		@my_score = 0

		@opponents_score = 0

		# create the new game and go directly to playing it
		redirect_to action: "show", id: @game.id
	end

	# GET /game/coin_games/1/edit
	def edit
	end

	# POST /game/coin_games
	# POST /game/coin_games.json
	def create
		@game_coin_game = Game::CoinGame.new(game_coin_game_params)

		respond_to do |format|
			if @game_coin_game.save
				format.html { redirect_to @game_coin_game, notice: 'Coin game was successfully created.' }
				format.json { render :show, status: :created, location: @game_coin_game }
			else
				format.html { render :new }
				format.json { render json: @game_coin_game.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /game/coin_games/1
	# PATCH/PUT /game/coin_games/1.json
	def update

		if @game.challengers.count == Game::CoinGame.MAX_SIZE 
			choices = ["tails", "heads"]
			flip = choices[rand(0..1)]

			# if the right guess
			if flip == params[:button]
				@game.add_a_win_for(cookies[:challenger_id].to_i)
			else
				other_challenger = @game.challengers.find { |c| c.id != cookies[:challenger_id].to_i }
				@game.add_a_win_for(other_challenger.id.to_i)
			end

			@game.save
		end

		respond_to do |format|
			format.html { render json: 0 } 
			format.json
			format.js { render json: 0 } # JBUILDER CODE MIGHT BE POSSIBLE HERE
		end
	end

	# DELETE /game/coin_games/1
	# DELETE /game/coin_games/1.json
	def destroy
		@game.destroy
		respond_to do |format|
			format.html { redirect_to game_coin_games_url, notice: 'Coin game was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_game_coin_game
		@game = Game::CoinGame.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def game_coin_game_params
		params[:game_coin_game]
	end
end
