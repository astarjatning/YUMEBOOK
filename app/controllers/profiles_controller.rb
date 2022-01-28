class ProfilesController < ApplicationController
  before_action :set_user
  
  def show;  end

  def edit;  end

  def update
    if @user.update(edit_params)
      redirect_to profile_path, success: 'プロフィールを更新しました'
    else
      flash.now[:danger] = 'プロフィールを更新できませんでした'
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def edit_params
    params.require(:user).permit(:name, :email, :avatar, :avatar_cache)
  end
end
