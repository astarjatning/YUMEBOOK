class DiariesController < ApplicationController
  before_action :set_diary, only: %i[edit update destroy]

  def index
    @diaries = Diary.all
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = current_user.diaries.build(diary_params)
    if @diary.save
      redirect_to @diary, warning: '日記を作成しました'
    else
      render :new
    end
  end

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
    params.require(:diary).permit(:title, :date, :story)
  end
end
