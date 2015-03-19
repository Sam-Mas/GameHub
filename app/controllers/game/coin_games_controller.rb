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

		# is it my turn?
		@my_turn = @game.my_turn?(cookies[:challenger_id].to_i)
		
		@num_turns = @game.num_turns

		# get scores
		@my_score = @game.get_score_for(cookies[:challenger_id].to_i)

		opponent = @game.get_opponent(cookies[:challenger_id])

		if opponent
			@opponents_score = @game.get_score_for(opponent.id)
		else
			@opponents_score = 0
		end

		# get guess and result
		@last_challengers_guess = @game.last_guess
		@last_flip_result = @game.last_flip_result

		@win_message = nil

		if @game.done?
			@win_message = @game.finished_message(cookies[:challenger_id])
			@my_turn = false
		end

	end

	# GET /game/coin_games/new
	def new
		# create the game
		@game = Game::CoinGame.new
		@game.score1 = 0
		@game.score2 = 0
		@game.challengers << Challenger.find(cookies[:challenger_id])
		@game.player_1_turn = true
		@game.last_guess = "No guess's yet"
		@game.last_flip_result = "No flips yet"

		# save the game with all the values above 
		@game.save

		# let the challenger see the necessary values
		@my_score = @game.score1
		@opponents_score = @game.score2
		@last_challengers_guess = @game.last_guess
		@last_flip_result = @game.last_flip_result
		@my_turn = true 

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
			@game.flip_for(cookies[:challenger_id], params[:button].to_s)
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
		params[:game_coin_game].permit(:score1, :score2)
	end
end
