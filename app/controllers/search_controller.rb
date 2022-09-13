class SearchController < ApplicationController
  def index
    @place = helpers.get_place_name(params[:search])
    @local_plants = helpers.get_data(params[:search])
    @selected_plants = []
  end

  def add_plant
    @selected_plants.push(params[:plant][:id])
    render :index
  end
end
