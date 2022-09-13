class SearchController < ApplicationController
  def index
    if params[:search] == 'geoloc'
      @place = helpers.get_place_name(helpers.usable_url(request.location.region))
      @plants = helpers.get_data(helpers.usable_url(request.location.region), 120)
    else
      @place = helpers.get_place_name(helpers.usable_url(params[:search]))
      @plants = helpers.get_data(helpers.usable_url(params[:search]), 120)
    end 
  end
end
