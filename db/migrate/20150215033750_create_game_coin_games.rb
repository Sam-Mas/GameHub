class CreateGameCoinGames < ActiveRecord::Migration
  def change
    create_table :game_coin_games do |t|

      t.timestamps null: false
    end
  end
end
