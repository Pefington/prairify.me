module StaticPagesHelper
  def current_user_projects
    Project.where(user_id: current_user.id)
  end

  def latest_projects
    projects = Project.joins(:photos_attachments)
    projects.reverse.first([projects.count, 8].min)
  end
end
