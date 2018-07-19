class DeleteIndexFromSubscriptions < ActiveRecord::Migration
  def change
    remove_index :subscriptions, name: "index_subscriptions_on_user_email"
    remove_index :subscriptions, name: "index_subscriptions_on_user_id"
    remove_index :subscriptions, name: "index_subscriptions_on_user_name"
  end
end
