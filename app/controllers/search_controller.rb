class SearchController < ApplicationController
  def index
    @place = helpers.get_place_name(params[:search])
    @local_plants = helpers.get_data(params[:search])
  end
end
