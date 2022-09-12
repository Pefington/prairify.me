class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def index
    @comments = @project.comments
  end

  def new
    puts "$"*50
    puts params
    puts "$"*50
    @comment = Comment.new
    @project = Project.find(params[:project_id])
  end

  def create
    puts "%"*50
    puts params
    puts "%"*50
  
    @comment = Comment.new(comment_params)
    @project = Project.find(params[:project_update][:project_id])
    @comment.update(project_id:@project.id)

    if @comment.save
      redirect_to @project, notice: "Comment was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to comments_url, notice: "Comment was successfully destroyed."
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content, :project_id, :user_id)
    end
end
