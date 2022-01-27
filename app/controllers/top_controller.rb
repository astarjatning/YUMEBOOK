class TopController < ApplicationController
  def top
    @diaries = Diary.order(created_at: :desc).limit(10)
  end
end
