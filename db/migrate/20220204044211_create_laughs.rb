class CreateLaughs < ActiveRecord::Migration[6.1]
  def change
    create_table :laughs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :diary, null: false, foreign_key: true

      t.timestamps
    end
    add_index :laughs, [:user_id, :diary_id], unique: true
  end
end
