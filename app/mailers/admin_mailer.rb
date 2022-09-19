class AdminMailer < ApplicationMailer
  default from: 'prairify@yopmail.com'

  def project_email(project)
    @user = project.user
    @urlx = 'https://www.prairify.me/admin/projects'
    @admins = User.where(role: 'admin')
    @admins.each do |admin|
      mail(to: admin.email, subject: 'New project on prairify')
    end
  end
end
