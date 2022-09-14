class Admin::ProjectsController < Admin::AdminController
  def index
    @q = Project.ransack(params[:q])
    @projects = @q.result(distinct: true).order(id: :asc).page(params[:page])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(secure_params)
      flash[:success] = 'The project has been successfully updated.'
      redirect_to admin_projects_path
    else
      flash[:error] = "The project couldn't be updated"
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:success] = 'The project has been successfully destroyed.'
    redirect_to admin_projects_path
  end

  private

  def secure_params
    params.require(:project).permit(:name, :description)
  end
end
