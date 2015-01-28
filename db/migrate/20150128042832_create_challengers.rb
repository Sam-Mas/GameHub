class CreateChallengers < ActiveRecord::Migration
  def change
    create_table :challengers do |t|

      t.timestamps null: false
    end
  end
end
