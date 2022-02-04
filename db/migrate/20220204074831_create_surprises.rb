class CreateSurprises < ActiveRecord::Migration[6.1]
  def change
    create_table :surprises do |t|
      t.references :user, null: false, foreign_key: true
      t.references :diary, null: false, foreign_key: true

      t.timestamps
    end
    add_index :surprises, [:user_id, :diary_id], unique: true
  end
end
