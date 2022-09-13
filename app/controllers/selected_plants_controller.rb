class SelectedPlantsController < ApplicationController
  before_action :set_selected_plant, only: %i[show edit update destroy]

  def index
    @selected_plants = SelectedPlant.all
  end

  def show; end

  def new
    @selected_plant = SelectedPlant.new
  end

  def edit; end

  def create
    @selected_plant = SelectedPlant.new(selected_plant_params)
    @selected_plant.user_id = current_user.id
    Rails.logger.debug params.inspect

    if @selected_plant.save
      render :new, flash.now[:notice] = 'Selected plant was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @selected_plant.update(selected_plant_params)
      redirect_to @selected_plant, notice: 'Selected plant was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @selected_plant.destroy
    redirect_to selected_plants_url, notice: 'Selected plant was successfully destroyed.'
  end

  private

  def set_selected_plant
    @selected_plant = SelectedPlant.find(params[:id])
  end

  def selected_plant_params
    Rails.logger.debug params.inspect
    params.permit(:user_id, :inaturalist_id)
  end
end
