class ResetSelectedPlantsController < ApplicationController
  def create
    SelectedPlant.where(user_id: current_user.id).destroy_all
    redirect_back(fallback_location: root_path)
  end
end
