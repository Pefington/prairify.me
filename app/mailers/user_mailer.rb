class UserMailer < ApplicationMailer
  default from: 'prairify@yopmail.com'
  def welcome_email(user)
    @user = user
    @url = 'http://prairify.herokuapp.com'
    @urlx = 'http://prairify.herokuapp.com/projects'
    mail(to: @user.email, subject: 'Welcome at Prairify')
  end

  def email_project(project)
    @project = project
    @user = @project.user
    @url = 'https://prairify.herokuapp.com/'
    mail(to: @user.email, subject: 'Project Begin on Prairify')
  end
end
