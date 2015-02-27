require 'test_helper'

class Game::CoinGamesControllerTest < ActionController::TestCase

	self.use_instantiated_fixtures = true
	fixtures :challengers

	setup do
		@game = game_coin_games(:one)
		@game.score1 = 0
		@game.score2 = 0
		challenger1 = Challenger.create(id: 1, name: "test1")
		challenger2 = Challenger.create(id: 2, name: "test2")
		if challenger1
			cookies[:challenger_id] = challenger1.id
			cookies[:challenger_name] = challenger1.name
		end
		@game.challengers << challenger1
		@game.challengers << challenger2
		@game.save
	end

	test "should get index" do
		get :index
		assert_response :success
		assert_not_nil assigns(:game_coin_games)
		assert_not_nil assigns(:coin_games_full)
		assert_not_nil assigns(:coin_games_need_another_player)
	end

	test "should get new" do
		assert_difference('Game::CoinGame.count', 1) do
			get :new
			assert_redirected_to(action: "show", id: Game::CoinGame.last.id) 
		end
	end

	test "should show game_coin_game" do
	# couldn't get this test to work with gon	
	end

	test "should get edit" do
		get :edit, id: @game.id
		assert_response :success
	end

	test "should update game_coin_game" do
		assert_difference('@game.score1 + @game.score2', 1) do
			patch :update, id: @game.id, params: { buttons: "tails" }
			@game.reload
		end
	end

	test "should destroy game_coin_game" do
		assert_difference('Game::CoinGame.count', -1) do
			delete :destroy, id: @game.id
		end

		assert_redirected_to game_coin_games_path
	end
end