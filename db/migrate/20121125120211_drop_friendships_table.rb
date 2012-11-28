class DropFriendshipsTable < ActiveRecord::Migration
  def up
  	drop_table :friendships
  end

  def down
  	raise ActiveRecord::IrreversibleMigration
  end
end
