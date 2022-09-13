class SearchController < ApplicationController
  def index
    selected_plants = SelectedPlant.where(user_id: current_user&.id)
    @selected_plants = selected_plants.map(&:inaturalist_id)

    @place = helpers.get_place_name(params[:search])
    @local_plants = helpers.get_data(params[:search])
    @hits = @local_plants.count
  end
end
