class PawsController < ApplicationController
  before_action :diary_params

  def create
    current_user.paws.create(diary_id: params[:id])
  end

  def destroy
    Paw.find_by(user_id: current_user.id, diary_id: params[:id]).destroy
  end

  private

  def diary_params
    @diary = Diary.find(params[:id])
  end
end
