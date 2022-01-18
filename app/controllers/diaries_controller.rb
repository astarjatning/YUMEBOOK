class DiariesController < ApplicationController
  before_action :set_diary, only: %i[show edit update destroy]

  def index
    @diaries = current_user.diaries.order(date: :asc) if params[:user_id].present?
    @dated_diaries = current_user.diaries.where(date: params[:date]).order(created_at: :asc) if params[:date].present?
  end

  def new
    @diary = Diary.new
    @word = Keyword.find(params[:keyword_id]) if params[:keyword_id].present?
    @diary.addings.build
  end
  
  def create
    @diary = current_user.diaries.build(diary_params)
    if @diary.save
      Adding.create(diary_id: @diary.id, keyword_id: params[:keyword][:keyword_id]) if params[:keyword].present?
      redirect_to @diary, warning: '日記を作成しました'
    else
      @word = Keyword.find(params[:keyword][:keyword_id])if params[:keyword].present?
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
    @diary = current_user.diaries.find(params[:id])
  end

  def diary_params
    params.require(:diary).permit(:title, :date, :story, addings_attributes: [:id, :keyword_id])
  end
end
