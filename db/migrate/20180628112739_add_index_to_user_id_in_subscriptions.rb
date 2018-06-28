class AddIndexToUserIdInSubscriptions < ActiveRecord::Migration
  def change
    add_index :subscriptions, :user_id, unique: true
  end
end
