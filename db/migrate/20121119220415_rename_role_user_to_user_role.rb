class RenameRoleUserToUserRole < ActiveRecord::Migration
	def change
		rename_table :roles_users, :users_roles
		rename_index :roles_users, :roles_users, :users_roles
	end
end
