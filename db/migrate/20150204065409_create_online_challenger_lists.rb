class CreateOnlineChallengerLists < ActiveRecord::Migration
  def change
    create_table :online_challenger_lists do |t|

      t.timestamps null: false
    end
  end
end
