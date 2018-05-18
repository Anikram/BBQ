class AddUniqValidationToDb < ActiveRecord::Migration
  def change
    add_index :users, [:user_name, unique: true]
    add_index :users, [:user_email, unique: true]
    add_index :subscriptions, [:user, unique: true]
    add_index :subscriptions, [:user_email, unique: true]
  end
end
