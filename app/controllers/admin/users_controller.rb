class Admin::UsersController < Admin::AdminController
  def index
    @users = User.all
  end

  def edit
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: 'Project was successfully destroyed.'
  end
end
