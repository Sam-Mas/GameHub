class AddPlayer1doneToGameCoinGames < ActiveRecord::Migration
  def change
    add_column :game_coin_games, :player1done, :boolean, default: false
  end
end
