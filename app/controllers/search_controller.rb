class SearchController < ApplicationController
  def index
    if params[:search] == 'geoloc'
      unless request.location.data['loc'].nil?
        @place_name_and_id = helpers.get_place_with_loc(request.location.data['loc'])
      end
    else
      @place_name_and_id = helpers.get_place(helpers.usable_url(params[:search].downcase)) unless params[:search].nil?
    end
    @place = @place_name_and_id[0] unless @place_name_and_id.nil?
    @local_plants = helpers.get_data(@place_name_and_id[1]) unless @place_name_and_id.nil?
    @hits = @local_plants.count unless @local_plants.nil?
    @hits = [] if @local_plants.nil?
    selected_plants = if current_user
                        SelectedPlant.where(user_id: current_user.id)
                      else
                        []
                      end
    @selected_plants = selected_plants.map(&:inaturalist_id)
  end
end
