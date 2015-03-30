class Game::CoinGamesController < ApplicationController
	before_action :set_game_coin_game, only: [:show, :update]

	# GET /game/coin_games
	# GET /game/coin_games.json
	def index
		debugger
		@game_coin_games = Game::CoinGame.all
		@coin_games_full = Game::CoinGame.all.find_all { |g| g.challengers.count == 2 }
		@coin_games_need_another_player = Game::CoinGame.all.find_all { |g| g.challengers.count == 1 && !g.game_full }
	end

	# GET /game/coin_games/1
	# GET /game/coin_games/1.json
	def show

		debugger
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

		debugger
		# create the game
		@game = Game::CoinGame.new
		@game.challengers << Challenger.find(cookies[:challenger_id])

		# save the game with all the values above 
		@game.save

		# create the new game and go directly to playing it
		redirect_to action: "show", id: @game.id

	end

	# PATCH/PUT /game/coin_games/1
	# PATCH/PUT /game/coin_games/1.json
	def update

		debugger
		if @game.challengers.count == Game::CoinGame.MAX_SIZE
			@game.flip_for(cookies[:challenger_id], params[:button].to_s)
		end

		respond_to do |format|
			format.html 
			format.json
			format.js { render :nothing => true }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_game_coin_game

		debugger
		@game = Game::CoinGame.find(params[:id])
	end

end
