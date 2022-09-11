class StaticPagesController < ApplicationController
  def home
  end

  def team
  end

  def about
  end

  def contact
  end

  def profile
    @profiles = current_user
    @projects = helpers.current_user_projects
  end
end
