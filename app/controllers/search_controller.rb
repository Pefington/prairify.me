class SearchController < ApplicationController
  def index
    if params[:search] == 'geoloc'
      puts request.location.inspect
      puts request.location.data['loc'] unless request.location.data['loc'].nil?

      @place_name_and_id = helpers.get_place_name_with_loc(request.location.data['loc']) unless request.location.data['loc'].nil?
      puts '@place_name_and_id'
      puts @place_name_and_id
      @place = @place_name_and_id[0]
      puts '@place'
      puts @place
      @local_plants = helpers.get_data(@place_name_and_id[1]) unless @place_name_and_id[1].nil?
      puts '@local_plants'
      puts @local_plants
    else
      @place_name_and_id = helpers.get_place(helpers.usable_url(params[:search]))
      @place = @place_name_and_id[0]
      @local_plants = helpers.get_data(@place_name_and_id[1])
    end
    @hits = @local_plants.count unless @local_plants.nil?
    @hits = [] if @local_plants.nil?
    puts '@hits'
    puts @hits
    selected_plants = if current_user
                        SelectedPlant.where(user_id: current_user.id)
                      else
                        []
                      end
    @selected_plants = selected_plants.map(&:inaturalist_id)
  end
end
