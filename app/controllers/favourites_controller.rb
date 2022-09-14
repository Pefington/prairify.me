class FavouritesController < ApplicationController
  before_action :authenticate_user!
  def index
    @projects = helpers.favourite_projects
  end

  def create
    @favourite = Favourite.new(project_id: params[:project_id], user_id: current_user.id)
    if @favourite.save
      flash.now[:success] = 'Favourite was successfully selected.'
    else
      flash.now[:alert] = 'Favourite was not created due to an error.'
    end
  end

  def destroy
    if Favourite.destroy(helpers.favourite?(Project.find(params[:id]))[1])
      flash.now[:success] = 'Favourite was successfully removed.'
    else
      flash.now[:alert] = 'Favourite was not deleted due to an error.'
    end
  end
end
