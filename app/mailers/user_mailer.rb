class UserMailer < ApplicationMailer
  def reset_password_email(user)
    @user = User.find(user.id)
    @url = edit_password_reset_url(@user.reset_password_token)
    mail(to: user.email,
         subject: t('defaults.password_reset'))
  end

  def greeting_mail(user)
    @user = User.find(user.id)
    @url = 'https://www.yume-book.com/login'
    mail(to: user.email,
         subject: t('defaults.greeting_mail'))
  end

  def account_deleted(user)
    mail(to: user.email,
         subject: t('defaults.account_deleted'))
  end
end
