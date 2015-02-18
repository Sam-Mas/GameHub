class AddCoinGameIdToChallenger < ActiveRecord::Migration
  def change
    add_column :challengers, :coin_game_id, :integer
  end
end
