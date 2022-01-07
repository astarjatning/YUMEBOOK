class ChangeDataDateToDiaries < ActiveRecord::Migration[6.1]
  def change
    change_column :diaries, :date, :date
  end
end
