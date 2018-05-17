class UserMailer < ApplicationMailer
  default from: "support@odinbook.com"

  def welcome(user)
    @user = user
    mail to: @user.email, subject: "Welcome to Odinbook" 
  end
end
