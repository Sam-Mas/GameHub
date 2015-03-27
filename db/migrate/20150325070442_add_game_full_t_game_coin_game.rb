class AddGameFullTGameCoinGame < ActiveRecord::Migration
  def change
    add_column :game_coin_games, :game_full, :boolean, default: false
  end
end
