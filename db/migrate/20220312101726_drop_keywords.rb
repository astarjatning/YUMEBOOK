class DropKeywords < ActiveRecord::Migration[6.1]
  def change
    drop_table :keywords
  end
end
