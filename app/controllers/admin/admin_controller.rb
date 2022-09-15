module Admin
  class AdminController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin
    layout 'admin/admin'

    private

    def authenticate_admin
      return if current_user.admin?

      flash[:alert] = 'Access denied - You are not authorized to access this page'
      redirect_to '/'
    end
  end
end
