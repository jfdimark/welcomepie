class DropFriendshipsTable < ActiveRecord::Migration
  def up
    begin
    	drop_table :friendships
    rescue
    end
  end

  def down
  	raise ActiveRecord::IrreversibleMigration
  end
end
