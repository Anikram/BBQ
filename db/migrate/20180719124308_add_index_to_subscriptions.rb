class AddIndexToSubscriptions < ActiveRecord::Migration
  def change
    add_index :subscriptions, :user_id
    add_index :subscriptions, :user_email
    add_index :subscriptions, :user_name
  end
end
