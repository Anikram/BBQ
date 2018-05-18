class AddUniqValidationToDb < ActiveRecord::Migration
  def change
    add_index :users, :name, unique: true
    add_index :subscriptions, :user_name, unique: true
    add_index :subscriptions, :user_email, unique: true
  end
end
