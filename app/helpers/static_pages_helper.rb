module StaticPagesHelper
  def current_user_projects
    Project.where(user_id: current_user.id)
  end
end
