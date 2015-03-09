class CreateChallengers < ActiveRecord::Migration
  def change
    create_table :challengers do |t|
	t.string :name
        t.float :balance, :default => '500.0'
        t.boolean :turn_taken, :default => false
        t.timestamps null: false
    end
  end
end
