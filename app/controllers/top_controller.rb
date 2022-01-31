class TopController < ApplicationController
  skip_before_action :require_login
  
  def top
    @diaries = Diary.order(created_at: :desc).limit(5)
  end
end
