class AddLastFlipResultToGameCoinGame < ActiveRecord::Migration
  def change
    add_column :game_coin_games, :last_flip_result, :string
  end
end
