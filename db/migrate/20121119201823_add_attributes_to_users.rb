class AddAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :occupation, :string
    add_column :users, :gender, :string
    add_column :users, :moving_from, :string
    add_column :users, :moving_to, :string
    add_column :users, :family_type, :string
    add_column :users, :age_bracket, :string
    add_column :users, :interests, :string
    add_column :users, :about_me, :text
    add_column :users, :username, :string
  end
end
