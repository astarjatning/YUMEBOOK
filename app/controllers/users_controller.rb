class UsersController < ApplicationController
  skip_before_action :require_login

  def show
    user = User.find_by(name: params[:name])
    @diaries = user.diaries.order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      auto_login(@user)
      redirect_to root_path, info: t('.success')
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
