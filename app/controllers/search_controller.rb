class SearchController < ApplicationController
  def index
    if params[:search] == 'geoloc'
      puts request.location.region
      puts helpers.usable_url(request.location.region)
      puts helpers.get_place_name(helpers.usable_url(request.location.region))
      @place = helpers.get_place_name(helpers.usable_url(request.location.region))
      @local_plants = helpers.get_data(helpers.usable_url(request.location.region))
    else
      @place = helpers.get_place_name(helpers.usable_url(params[:search]))
      @local_plants = helpers.get_data(helpers.usable_url(params[:search]))
    end
    @hits = @local_plants.count
    selected_plants = SelectedPlant.where(user_id: current_user&.id)
    @selected_plants = selected_plants.map(&:inaturalist_id)
  end
end
