class AddWinner < ActiveRecord::Migration
  def change
  	add_column :game_coin_games, :winner, :int, default: 0
  end
end
