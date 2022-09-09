class LikesController < ApplicationController

  def create
    Like.create(project_id: params[:project_id], user_id: current_user.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    Like.destroy(params[:id])
    redirect_back(fallback_location: root_path)
  end

end
