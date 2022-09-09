class FavouritesController < ApplicationController
  def create
    Favourite.create(project_id: params[:project_id], user_id: current_user.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    Favourite.destroy(params[:id])
    redirect_back(fallback_location: root_path)
  end
end
