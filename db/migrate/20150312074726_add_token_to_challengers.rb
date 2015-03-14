class AddTokenToChallengers < ActiveRecord::Migration
  def change
    add_column :challengers, :token, :string
  end
end
