class ChangeNotnullToDiaries < ActiveRecord::Migration[6.1]
  def up
    change_column_null :diaries, :date, true
    change_column_null :diaries, :title, false
    change_column_null :diaries, :story, false
  end
  
  def down
    change_column_null :diaries, :date, false
    change_column_null :diaries, :title, true
    change_column_null :diaries, :story, true
  end
end
