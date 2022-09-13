class SearchController < ApplicationController
  def index
    @place = helpers.get_place_name(params[:search])
    @local_plants = helpers.get_data(params[:search])
    @hits = @local_plants.count
  end
end
