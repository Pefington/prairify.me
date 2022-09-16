module Admin
  class CommentsController < Admin::AdminController
    def index
      @q = Comment.ransack(params[:q])
      @comments = @q.result(distinct: true).order(id: :asc).page(params[:page])
    end

    def edit
      @comment = Comment.find(params[:id])
    end

    def update
      @comment = Comment.find(params[:id])
      if @comment.update(secure_params)
        flash[:success] = 'The comment has been successfully updated.'
        redirect_to admin_comments_path
      else
        flash[:error] = "The comment couldn't be updated"
        render :edit
      end
    end

    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      flash[:success] = 'The comment has been successfully destroyed.'
      redirect_to admin_comments_path
    end

    private

    def secure_params
      params.require(:comment).permit(:content)
    end
  end
end
