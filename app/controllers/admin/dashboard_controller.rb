module Admin
  class DashboardController < Admin::AdminController
    def index
      @users = User.all

      @projects = Project.all

      @comments = Comment.all

      @latest_users = User.order('id desc').first(10)

      @latest_projects = Project.order('id desc').first(10)

      @users_week = User.where('created_at > ?', 1.week.ago).count

      @users_month = User.where('created_at > ?', 1.month.ago).count

      @projects_week = Project.where('created_at > ?', 1.week.ago).count

      @projects_month = Project.where('created_at > ?', 1.month.ago).count
    end
  end
end
