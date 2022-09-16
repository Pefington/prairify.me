class ProjectUpdatesController < ApplicationController
  before_action :set_project_update, only: %i[destroy]
  before_action :authenticate_user!

  def new
    @project_update = ProjectUpdate.new
    @project = Project.find(params[:project_id])
  end

  def create
    @project_update = ProjectUpdate.new(project_update_params)
    @project = Project.find(params[:project_update][:project_id])
    @project_update.update(project_id: @project.id)
    if @project_update.save
      redirect_to @project, notice: t('updateproject')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @project_update.destroy
    redirect_to project_updates_url, notice: t('updateprojectdestroy')
  end

  private

  def set_project_update
    @project_update = ProjectUpdate.find(params[:id])
  end

  def project_update_params
    params.require(:project_update).permit(:title, :description, :project_id, :photo)
  end
end
