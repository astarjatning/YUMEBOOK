class DiariesController < ApplicationController
  before_action :set_diary, only: %i[show edit update destroy]

  def index
    @diaries = current_user.diaries.all
  end

  def new
    @diary = Diary.new
    @word = Keyword.find(params[:keyword_id]) if params[:keyword_id].present?
  end
  
  def create
    @diary = current_user.diaries.build(diary_params)
    @diary.addings.build(params[:keyword_id])

    if @diary.save
      redirect_to @diary, warning: '日記を作成しました'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @diary.update(diary_params)
      redirect_to @diary, warning: '日記を更新しました'
    else
      flash.now[:danger] = '日記を更新できませんでした'
      render :edit
    end
  end

  def destroy
    @diary.destroy!
    redirect_to diaries_path, warning: '日記を削除しました'
  end

  private

  def set_diary
    @diary = Diary.find(params[:id])
  end

  def diary_params
    params.require(:diary).permit(:title, :date, :story, addings_attributes: [:id, :keyword_id])
  end
end
