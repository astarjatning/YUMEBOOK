class RemoveUserFromLikes < ActiveRecord::Migration[6.1]
  def change
    remove_column :likes, :user_id, :bigint
    remove_column :laughs, :user_id, :bigint
    remove_column :cries, :user_id, :bigint
    remove_column :surprises, :user_id, :bigint
    remove_column :paws, :user_id, :bigint
  end
end
