class AddChallengerRefToGameCoinGame < ActiveRecord::Migration
  def change
    add_reference :game_coin_games, :challenger, index: true
    add_foreign_key :game_coin_games, :challengers
  end
end
