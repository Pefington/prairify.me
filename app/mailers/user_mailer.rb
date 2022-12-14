class UserMailer < ApplicationMailer
  default from: 'prairify@yopmail.com'
  def welcome_email(user)
    @user = user
    @url = 'https://www.prairify.me/'
    @urlx ='https://www.prairify.me/projects'
    mail(to: @user.email, subject: 'Welcome at Prairify')
  end

  def email_project(project)
    @project = project
    @user = @project.user
    @url = 'https://www.prairify.me/'
    mail(to: @user.email, subject: 'Project Begin on Prairify')
  end
end
