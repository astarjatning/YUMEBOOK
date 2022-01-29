class DiariesController < ApplicationController
  before_action :set_diary, only: %i[edit update destroy]

  def index
    @diaries = current_user.diaries.order(date: :desc)
  end

  def new
    @diary = Diary.new
  end
  
  def create
    @diary = current_user.diaries.build(diary_params)
    if @diary.save
      redirect_to @diary, warning: t('.success')
    else
      render :new
    end
  end

  def show
    @diary = Diary.find(params[:id])
  end

  def edit; end

  def update
    if @diary.update(diary_params)
      redirect_to @diary, warning: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @diary.destroy!
    redirect_to diaries_path, warning: t('.success')
  end

  private

  def set_diary
    @diary = current_user.diaries.find(params[:id])
  end

  def diary_params
    params.require(:diary).permit(:title, :date, :story, addings_attributes: [:id, :keyword_id])
  end
end
