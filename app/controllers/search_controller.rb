class SearchController < ApplicationController
  def index
    @place = helpers.get_place_name(params[:search])
    @plants = helpers.get_data(params[:search], 120)
  end
end