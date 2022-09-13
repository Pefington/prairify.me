class SelectedPlantsController < ApplicationController
  before_action :set_selected_plant, only: %i[destroy]
  skip_before_action :verify_authenticity_token, only: [:reset]

  def create
    @selected_plant = SelectedPlant.new(selected_plant_params)
    @selected_plant.user_id = current_user.id
    Rails.logger.debug params.inspect

    if @selected_plant.save
      flash.now[:success] = 'Plant was successfully selected.'
    else
      flash.now[:alert] = 'Plant was not selected due to an error.'
    end
  end

  def destroy
    @selected_plant.destroy
    flash.now[:success] = 'Plant was successfully removed.'
  end

  def reset
    SelectedPlant.where(user_id: current_user.id).destroy_all
    flash.now[:notice] = 'Selected plants were successfully reset.'
  end

  private

  def set_selected_plant
    @selected_plant = SelectedPlant.find(params[:id])
  end

  def selected_plant_params
    params.permit(:user_id, :inaturalist_id)
  end
end
