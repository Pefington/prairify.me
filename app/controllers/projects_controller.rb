class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @projects = if params[:sort_by].nil?
                  Project.all
                else
                  helpers.project_sorted_by(params[:sort_by])
                end
  end

  def show
    @project = Project.find(params[:id])
    @project_updates = @project.project_updates
    @comments = @project.comments
    @plants = @project.plants
  end

  def new
    @project = Project.new
  end

  def edit; end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      helpers.transfer_plants(@project)
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :place_name, :begin, :finish, :photos, :country)
  end
end
