class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :role, :integer, limit: 1, default: 0, null: false
  end
end
