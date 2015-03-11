class AddPlayer2doneToGameCoinGames < ActiveRecord::Migration
  def change
    add_column :game_coin_games, :player2done, :boolean, default: false
  end
end
