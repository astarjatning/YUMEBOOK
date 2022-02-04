class CreateCries < ActiveRecord::Migration[6.1]
  def change
    create_table :cries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :diary, null: false, foreign_key: true

      t.timestamps
    end
    add_index :cries, [:user_id, :diary_id], unique: true
  end
end
