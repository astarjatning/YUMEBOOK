class UserSessionsController < ApplicationController
  skip_before_action :require_login
  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to root_path, info: t('.success')
    else
      flash.now[:error] = t('.fail')
      render :new
    end
  end

  def destroy
    @user = logout
    redirect_to root_path, info: t('.success')
  end
end
