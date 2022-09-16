class SelectedPlantsController < ApplicationController
  def create
    @selected_plant = SelectedPlant.new(selected_plant_params)
    @selected_plant.user_id = current_user.id
    if @selected_plant.save
      flash.now[:success] = 'Plant was successfully selected.'
    else
      flash.now[:alert] = 'Plant was not selected due to an error.'
    end
  end

  def destroy
    SelectedPlant.find_by(user_id: current_user.id, inaturalist_id: params[:id]).destroy
    flash.now[:success] = 'Plant was successfully removed.'
  end

  private

  def selected_plant_params
    params.permit(:user_id, :inaturalist_id)
  end
end
