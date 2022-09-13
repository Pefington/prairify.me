class SelectedPlantsController < ApplicationController
  before_action :set_selected_plant, only: %i[show edit update destroy]

  # GET /selected_plants
  def index
    @selected_plants = SelectedPlant.all
  end

  # GET /selected_plants/1
  def show; end

  # GET /selected_plants/new
  def new
    @selected_plant = SelectedPlant.new
  end

  # GET /selected_plants/1/edit
  def edit; end

  # POST /selected_plants
  def create
    @selected_plant = SelectedPlant.new(selected_plant_params)
    @selected_plant.user_id = current_user.id
    Rails.logger.debug params.inspect

    if @selected_plant.save
      flash[:success] = 'Selected plant was successfully created.'
    else
      flash[:alert] = 'Plant is already selected.'
    end
  end

  # PATCH/PUT /selected_plants/1
  def update
    if @selected_plant.update(selected_plant_params)
      redirect_to @selected_plant, notice: 'Selected plant was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /selected_plants/1
  def destroy
    @selected_plant.destroy
    flash[:success] = 'Selected plant was successfully created.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_selected_plant
    @selected_plant = SelectedPlant.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def selected_plant_params
    Rails.logger.debug params.inspect
    params.permit(:user_id, :inaturalist_id)
  end
end
