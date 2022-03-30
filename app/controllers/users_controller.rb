class UsersController < ApplicationController
  skip_before_action :require_login

  def show
    @user = User.find_by(name: params[:name])
    @diaries = @user.diaries.page(params[:page]).order(created_at: :desc)
    @diaries_on_calendar = @user.diaries.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      auto_login(@user)
      UserMailer.greeting_mail(@user).deliver_now
      redirect_to root_path, info: t('.success')
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    UserMailer.account_deleted(@user).deliver_now
    @user.destroy!
    redirect_to root_path
  end

  def search
    @user = User.find(params[:id])
    @diaries = @user.diaries.where("DATE(created_at) = '#{params[:date]}'").order(created_at: :desc)
    @diaries_on_calendar = @user.diaries.all
    @date = params[:date].to_date
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :terms_of_service)
  end
end
