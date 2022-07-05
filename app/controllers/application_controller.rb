class ApplicationController < ActionController::Base
  before_action :require_login
  add_flash_types :success, :info, :warning, :danger

  def users_show?
    controller_name == 'users' && action_name == 'show'
  end

  private

  def not_authenticated
    redirect_to main_app.login_path, warning: (t 'defaults.message.require_login')
  end
end
