class AddScore1ToGameCoinGames < ActiveRecord::Migration
  def change
    add_column :game_coin_games, :score1, :integer, default: 0
  end
end
