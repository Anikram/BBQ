class RemoveIndexFromUserInSubscriptions < ActiveRecord::Migration
  def change
    remove_index :subscriptions, :user_id
  end
end
