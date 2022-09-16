class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = Like.new(project_id: params[:project_id], user_id: current_user.id)
    if @like.save
      flash.now[:success] = 'Like was successfully selected.'
    else
      flash.now[:alert] = 'Like was not created due to an error.'
    end
  end

  def destroy
    if Like.destroy(helpers.liked?(Project.find(params[:id]))[1])
      flash.now[:success] = 'Like was successfully removed.'
    else
      flash.now[:alert] = 'Like was not deleted due to an error.'
    end
  end
end
