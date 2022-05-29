class AddIndexResetPasswordTokenToUsers < ActiveRecord::Migration[6.1]
  def up
    remove_index :users, :reset_password_token
    add_index :users, :reset_password_token, unique: true
  end

  def down
    remove_index :users, :reset_password_token
    add_index :users, :reset_password_token
  end
end
