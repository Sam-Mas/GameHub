class AddNameColumnToChallenger < ActiveRecord::Migration
  def change
    add_column :challengers, :name, :string
  end
end
