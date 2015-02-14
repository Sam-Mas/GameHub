class CreateChallengers < ActiveRecord::Migration
  def change
    create_table :challengers do |t|
	t.string :name
	t.float :balance, :default => '0.0'
     	t.timestamps
    end
  end
end
