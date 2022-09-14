class StaticPagesController < ApplicationController
  def home
    @projects = helpers.latest_projects
  end

  def profile
    @profile = current_user
    @projects = helpers.current_user_projects
  end
end
