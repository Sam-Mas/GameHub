class AddScore2ToGameCoinGames < ActiveRecord::Migration
  def change
    add_column :game_coin_games, :score2, :integer, default: 0
  end
end
