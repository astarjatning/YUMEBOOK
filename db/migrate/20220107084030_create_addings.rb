class CreateAddings < ActiveRecord::Migration[6.1]
  def change
    create_table :addings do |t|
      t.references :diary, null: false, foreign_key: true
      t.references :keyword, null: false, foreign_key: true

      t.timestamps
    end
  end
end
