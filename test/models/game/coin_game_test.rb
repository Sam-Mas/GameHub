require 'test_helper'

class Game::CoinGameTest < ActiveSupport::TestCase
  
  test "Scores retrieval resulting in correct values" do
  	game = Game::CoinGame.new
	game.score1 = 5
	game.score2 = 7
	game.save

	assert_equal(5, game.score1,"Score1 retrivial is not expected value")
	assert_equal(7, game.score2,"Score1 retrivial is not expected value")

  end

  test "should not allow for null values to be set in score1 and score2" do
  	game = Game::CoinGame.new(score1: nil, score2: nil)

	assert_not game.save, "Saved a game with nil values as the scores"

  end
  
end
