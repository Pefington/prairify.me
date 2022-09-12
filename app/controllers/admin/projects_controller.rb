class Admin::ProjectsController < Admin::AdminController
  def index
    @projects = Project.all
  end

  def edit
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to admin_projects_path, notice: 'Project was successfully destroyed.'
  end
end
