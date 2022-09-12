class Admin::DashboardController < Admin::AdminController
  def index
    @users = User.all
    @latest_users = User.order('id ASC').reverse_order.last(10)
    @projects = Project.all
    @latest_projects = Project.order('id ASC').reverse_order.last(10)
    @last_users_seven_days = User.where(
      'created_at >= :seven_days_ago',
      seven_days_ago: 7.days.ago
    ).count
    @last_users_thirty_days = User.where(
      'created_at >= :thirty_days_ago',
      thirty_days_ago: 30.days.ago
    ).count
    @last_projects_seven_days = Project.where(
      'created_at >= :seven_days_ago',
      seven_days_ago: 7.days.ago
    ).count
    @last_projects_thirty_days = Project.where(
      'created_at >= :thirty_days_ago',
      thirty_days_ago: 30.days.ago
    ).count
  end
end
