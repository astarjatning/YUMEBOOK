class DiariesController < ApplicationController
  before_action :set_diary, only: %i[edit update destroy]
  skip_before_action :require_login, only: %i[show index search]

  def index
    @diaries = Diary.includes(:user).page(params[:page]).order(created_at: :desc)
  end

  def new
    @diary = Diary.new
  end
  
  def create
    @diary = current_user.diaries.build(diary_params)
    tag_list = params[:diary][:tag_name].split(/[[:blank:]]/)
    if @diary.save
      @diary.save_tag(tag_list)
      redirect_to root_path, info: t('.success')
    else
      render :new
    end
  end

  def show
    @diary = Diary.find(params[:id])
  end

  def edit
    @tag_list = @diary.tags.pluck(:tag_name).join(' ')
  end

  def update
    @tag_list = params[:diary][:tag_name].split(/[[:blank:]]/)
    if @diary.update(diary_params)
      @diary.save_tag(@tag_list)
      redirect_to @diary, info: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @diary.destroy!
    redirect_to diaries_path, info: t('.success')
  end

  def search
    @tag = Tag.find(params[:tag_id])
    @diaries = @tag.diaries.includes(:user).page(params[:page]).order(created_at: :desc)
  end

  private

  def set_diary
    @diary = current_user.diaries.find(params[:id])
  end

  def diary_params
    params.require(:diary).permit(:title, :date, :story, addings_attributes: [:id, :keyword_id])
  end
end
