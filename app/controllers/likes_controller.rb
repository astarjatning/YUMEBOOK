class LikesController < ApplicationController
  skip_before_action :require_login
  before_action :diary_params

  def create
    Like.create(diary_id: params[:id])
  end

  private

  def diary_params
    @diary = Diary.find(params[:id])
  end
end
