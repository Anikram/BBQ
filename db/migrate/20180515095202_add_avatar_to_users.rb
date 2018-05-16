class AddAvatarToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :String
  end
end
