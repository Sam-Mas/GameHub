class AddPlayer1TurnToGameCoinGame < ActiveRecord::Migration
  def change
    add_column :game_coin_games, :player_1_turn, :boolean
  end
end
