class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = Like.new(project_id: params[:project_id], user_id: current_user.id)
    # redirect_back(fallback_location: root_path)
    if @like.save
      flash.now[:success] = 'Like was successfully selected.'
    else
      flash.now[:alert] = 'Like was not created due to an error.'
    end
  end

  def destroy
    Like.destroy(params[:id])
    flash.now[:success] = 'Like was successfully removed.'
  end

end
