class StaticPagesController < ApplicationController

  def profile
    @profile = current_user
    @projects = helpers.current_user_projects
  end
end
