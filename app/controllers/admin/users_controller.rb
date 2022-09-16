module Admin
  class UsersController < Admin::AdminController
    def index
      @q = User.ransack(params[:q])
      @users = @q.result(distinct: true).order(id: :asc).page(params[:page])
    end

    def edit
      @user = User.find(params[:id])
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(new_secure_params)
      if @user.save
        flash[:success] = 'The account has been created'
        redirect_to admin_users_path
      else
        flash[:error] = "The account couldn't be created"
        render :new
      end
    end

    def update
      @user = User.find(params[:id])
      if @user.update(edit_secure_params)
        flash[:success] = 'The account has been successfully updated.'
        redirect_to admin_users_path
      else
        flash[:error] = "The account couldn't be updated"
        render :edit
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      flash[:success] = 'The account has been successfully destroyed.'
      redirect_to admin_users_path
    end

    private

    def edit_secure_params
      params.require(:user).permit(:email, :username, :role)
    end

    def new_secure_params
      params.require(:user).permit(:email, :username, :role, :password, :password_confirmation)
    end
  end
end
