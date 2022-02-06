class DropMeanings < ActiveRecord::Migration[6.1]
  def change
    drop_table :meanings do
    end
  end
end
