class AddLastGuessToGameCoinGame < ActiveRecord::Migration
  def change
    add_column :game_coin_games, :last_guess, :string
  end
end
