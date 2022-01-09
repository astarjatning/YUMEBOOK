class CreateMeanings < ActiveRecord::Migration[6.1]
  def change
    create_table :meanings do |t|
      t.references :keyword, null: false, foreign_key: true
      t.references :connotation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
