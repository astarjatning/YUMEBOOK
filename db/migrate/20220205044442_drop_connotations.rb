class DropConnotations < ActiveRecord::Migration[6.1]
  def change
    drop_table :connotations do
    end
  end
end
