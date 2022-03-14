class UsersController < ApplicationController
  skip_before_action :require_login

  def show
    @user = User.find_by(name: params[:name])
    @diaries = @user.diaries.page(params[:page]).order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      auto_login(@user)
      UserMailer.with(user: @user).greeting_mail.deliver_later
      redirect_to root_path, info: t('.success')
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    UserMailer.with(user: @user).account_deleted.deliver_later
    @user.destroy!
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :terms_of_service)
  end
end
