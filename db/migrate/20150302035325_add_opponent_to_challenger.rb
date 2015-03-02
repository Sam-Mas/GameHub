class AddOpponentToChallenger < ActiveRecord::Migration
  def change
    add_column :challengers, :opponent, :string
  end
end
