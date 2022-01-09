class CreateConnotations < ActiveRecord::Migration[6.1]
  def change
    create_table :connotations do |t|
      t.string :connotation, null: false

      t.timestamps
    end
  end
end
