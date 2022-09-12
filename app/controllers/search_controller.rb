class SearchController < ApplicationController
  def index
    @place = helpers.get_place_name(params[:search])
    @local_plants = helpers.get_data(params[:search])
    @indexes_to_show = helpers.indexes_to_show
  end
end
