class AddNumberOfTurnsToGame < ActiveRecord::Migration
  def change
    add_column :game_coin_games, :num_turns, :int, default: 5
  end
end
