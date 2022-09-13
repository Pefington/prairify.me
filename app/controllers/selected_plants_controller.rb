class SelectedPlantsController < ApplicationController
  before_action :set_selected_plant, only: %i[destroy]

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

  def destroy
    @selected_plant.destroy
    flash[:success] = 'Selected plant was successfully created.'
  end

  private

  def set_selected_plant
    @selected_plant = SelectedPlant.find(params[:id])
  end

  def selected_plant_params
    params.permit(:user_id, :inaturalist_id)
  end
end
