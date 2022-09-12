class ProjectUpdatesController < ApplicationController
  before_action :set_project_update, only: %i[ show edit update destroy ]
  before_action :get_project
  before_action :authenticate_user!

  # GET /project_updates
  def index
    @project_updates = @project.project_updates
  end

  # GET /project_updates/1
  def show
  end

  # GET /project_updates/new
  def new
    @project_update = ProjectUpdate.new
  end

  # GET /project_updates/1/edit
  def edit
  end

  # POST /project_updates
  def create
    @project_update = ProjectUpdate.new(project_update_params)

    if @project_update.save
      redirect_to @project_update, notice: "Project update was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /project_updates/1
  def update
    if @project_update.update(project_update_params)
      redirect_to @project_update, notice: "Project update was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /project_updates/1
  def destroy
    @project_update.destroy
    redirect_to project_updates_url, notice: "Project update was successfully destroyed."
  end

  private
    def set_project_update
      @project_update = ProjectUpdate.find(params[:id])
    end

    def project_update_params
      params.require(:project_update).permit(:title, :description, :project_id)
    end

    def get_project
      @project = Project.find(params[:project_id])
    end
end
