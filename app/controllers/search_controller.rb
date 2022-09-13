class SearchController < ApplicationController
  def index
    if params[:search] == 'geoloc'
      @place = helpers.get_place_name(helpers.usable_url(request.location.region))
      @local_plants = helpers.get_data(helpers.usable_url(request.location.region))
    else
      @place = helpers.get_place_name(helpers.usable_url(params[:search]))
      @local_plants = helpers.get_data(helpers.usable_url(params[:search]))
    @selected_plants = []
  end

  def add_plant
    @selected_plants.push(params[:plant][:id])
    render :index
    end 
  end
end
