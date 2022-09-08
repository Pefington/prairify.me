class UserMailer < ApplicationMailer
  default from: "prairify@yopmail.com"
  def welcome_email(user)
    @user = user
    @url = "http://prairify.herokuapp.com"
    mail(to: @user.email, subject: 'Welcome at Prairify')
  end
end
