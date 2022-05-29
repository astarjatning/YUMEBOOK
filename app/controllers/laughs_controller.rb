class LaughsController < ApplicationController
  skip_before_action :require_login, only: %i[create]
  before_action :set_diary, only: %i[create]

  def create
    Laugh.create(diary_id: params[:id])
  end

  private

  def set_diary
    @diary = Diary.find(params[:id])
  end
end
