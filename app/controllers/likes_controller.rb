class LikesController < ApplicationController
  before_action :diary_params

  def create
    current_user.likes.create(diary_id: params[:id])
  end

  def destroy
    Like.find_by(user_id: current_user.id, diary_id: params[:id]).destroy
  end

  private

  def diary_params
    @diary = Diary.find(params[:id])
  end
end
