class AddDefaultGameTurn < ActiveRecord::Migration
  def change
	change_column_default :game_coin_games, :player_1_turn, true
  end
end
